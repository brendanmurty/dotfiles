atom.commands.add 'atom-text-editor',
  'custom:start-meeting-log': ->
    # Add initial meeting log content to a new empty editor window
    editor = atom.workspace.getActiveTextEditor()
    date = new Date().toDateString()
    editor.insertText('# Meeting - ' + date + '\n\n\n\n## Notes\n\n- \n')
    editor.moveUp()
    editor.moveRight(3)
