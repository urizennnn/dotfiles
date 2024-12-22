# Source this in your ~/.con***REMOVED***g/nushell/con***REMOVED***g.nu
$env.ATUIN_SESSION = (atuin uuid)
hide-env -i ATUIN_HISTORY_ID

# Magic token to make sure we don't record commands run by keybindings
let ATUIN_KEYBINDING_TOKEN = $***REMOVED***# (random uuid)***REMOVED***

let _atuin_pre_execution = {||
    if ($nu | get -i history-enabled) == false {
        return
    }
    let cmd = (commandline)
    if ($cmd | is-empty) {
        return
    }
    if not ($cmd | str starts-with $ATUIN_KEYBINDING_TOKEN) {
        $env.ATUIN_HISTORY_ID = (atuin history start -- $cmd)
    }
}

let _atuin_pre_prompt = {||
    let last_exit = $env.LAST_EXIT_CODE
    if 'ATUIN_HISTORY_ID' not-in $env {
        return
    }
    with-env { ATUIN_LOG: error } {
        do { atuin history end $'--exit=($last_exit)' -- $env.ATUIN_HISTORY_ID } | complete

    }
    hide-env ATUIN_HISTORY_ID
}

def _atuin_search_cmd [...flags: string] {
    let nu_version = do {
        let version = version
        let major = $version.major?
        if $major != null {
            # These members are only available in versions > 0.92.2
            [$major $version.minor $version.patch]
        } ***REMOVED*** {
            # So fall back to the slower parsing when they're missing
            $version.version | split row '.' | into int
        }
    }
    [
        $ATUIN_KEYBINDING_TOKEN,
        ([
            `with-env { ATUIN_LOG: error, ATUIN_QUERY: (commandline) } {`,
                (if $nu_version.0 <= 0 and $nu_version.1 <= 90 { 'commandline' } ***REMOVED*** { 'commandline edit' }),
                (if $nu_version.1 >= 92 { '(run-external atuin search' } ***REMOVED*** { '(run-external --redirect-stderr atuin search' }),
                    ($flags | append [--interactive] | each {|e| $'***REMOVED***($e)***REMOVED***'}),
                (if $nu_version.1 >= 92 { ' e>| str trim)' } ***REMOVED*** {' | complete | $in.stderr | str substring ..-1)'}),
            `}`,
        ] | flatten | str join ' '),
    ] | str join ***REMOVED***\n***REMOVED***
}

$env.con***REMOVED***g = ($env | default {} con***REMOVED***g).con***REMOVED***g
$env.con***REMOVED***g = ($env.con***REMOVED***g | default {} hooks)
$env.con***REMOVED***g = (
    $env.con***REMOVED***g | upsert hooks (
        $env.con***REMOVED***g.hooks
        | upsert pre_execution (
            $env.con***REMOVED***g.hooks | get -i pre_execution | default [] | append $_atuin_pre_execution)
        | upsert pre_prompt (
            $env.con***REMOVED***g.hooks | get -i pre_prompt | default [] | append $_atuin_pre_prompt)
    )
)

$env.con***REMOVED***g = ($env.con***REMOVED***g | default [] keybindings)

$env.con***REMOVED***g = (
    $env.con***REMOVED***g | upsert keybindings (
        $env.con***REMOVED***g.keybindings
        | append {
            name: atuin
            modi***REMOVED***er: control
            keycode: char_r
            mode: [emacs, vi_normal, vi_insert]
            event: { send: executehostcommand cmd: (_atuin_search_cmd) }
        }
    )
)

$env.con***REMOVED***g = (
    $env.con***REMOVED***g | upsert keybindings (
        $env.con***REMOVED***g.keybindings
        | append {
            name: atuin
            modi***REMOVED***er: none
            keycode: up
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {send: menuup}
                    {send: executehostcommand cmd: (_atuin_search_cmd '--shell-up-key-binding') }
                ]
            }
        }
    )
)

