--
-- Notion tiling module configuration file
--

-- Bindings for the tilings. 
defbindings("WTiling", {
    bdoc("Go to frame right of current frame."),
    kpress(META.."Right", "ioncore.goto_next(_sub, 'right')"),
    bdoc("Go to frame left of current frame."),
    kpress(META.."Left", "ioncore.goto_next(_sub, 'left')"),
    bdoc("Go to frame above current frame."),
    kpress(META.."Up", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    bdoc("Go to frame below current frame."),
    kpress(META.."Down", "ioncore.goto_next(_sub, 'down', {no_ascend=_})"),

    bdoc("Split current frame vertically."),
    kpress(META.."bracketright", "WTiling.split_at(_, _sub, 'bottom', true)"),
    bdoc("Split current frame horizontally."),
    kpress(META.."bracketleft", "WTiling.split_at(_, _sub, 'right', true)"),
    
    bdoc("Split screen vertically."),
    kpress(META.."Shift+bracketright", "WTiling.split_top(_, 'bottom')"),
    bdoc("Split screen horizontally."),
    kpress(META.."Shift+bracketleft", "WTiling.split_top(_, 'right')"),

    bdoc("Destroy current frame."),
    kpress(META.."Shift+apostrophe", "WTiling.unsplit_at(_, _sub)"),
})

-- Frame bindings.
defbindings("WFrame.floating", {
    submap(META.."K", {
        bdoc("Tile frame, if no tiling exists on the workspace"),
        kpress("B", "mod_tiling.mkbottom(_)"),
    }),
})

-- Context menu for tiled workspaces.
defctxmenu("WTiling", "Tiling", {
    menuentry("Destroy frame", 
              "WTiling.unsplit_at(_, _sub)"),

    menuentry("Split vertically", 
              "WTiling.split_at(_, _sub, 'bottom', true)"),
    menuentry("Split horizontally", 
              "WTiling.split_at(_, _sub, 'right', true)"),
    
    menuentry("Flip", "WTiling.flip_at(_, _sub)"),
    menuentry("Transpose", "WTiling.transpose_at(_, _sub)"),
    
    menuentry("Untile", "mod_tiling.untile(_)"),
    
    submenu("Float split", {
        menuentry("At left", 
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'left')"),
        menuentry("At right", 
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'right')"),
        menuentry("Above",
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'up')"),
        menuentry("Below",
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'down')"),
    }),

    submenu("At root", {
        menuentry("Split vertically", 
                  "WTiling.split_top(_, 'bottom')"),
        menuentry("Split horizontally", 
                  "WTiling.split_top(_, 'right')"),
        menuentry("Flip", "WTiling.flip_at(_)"),
        menuentry("Transpose", "WTiling.transpose_at(_)"),
    }),
})

-- Extra context menu extra entries for floatframes. 
defctxmenu("WFrame.floating", "Floating frame", {
    append=true,
    menuentry("New tiling", "mod_tiling.mkbottom(_)"),
})
