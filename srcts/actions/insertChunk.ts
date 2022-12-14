import {
  editor,
  Range,
  KeyMod,
  KeyCode,
} from "monaco-editor/esm/vs/editor/editor.api";

export const registerInsertCommand = (editor: editor.IStandaloneCodeEditor) => {
  editor.addCommand(KeyMod.CtrlCmd | KeyMod.WinCtrl | KeyCode.KeyI, () =>
    insertChunk(editor, "r")
  );

  editor.addCommand(KeyMod.CtrlCmd | KeyMod.WinCtrl | KeyCode.KeyP, () =>
    insertChunk(editor, "python")
  );

  editor.addCommand(KeyMod.CtrlCmd | KeyMod.WinCtrl | KeyCode.KeyJ, () =>
    insertChunk(editor, "julia")
  );

  editor.addCommand(KeyMod.CtrlCmd | KeyMod.WinCtrl | KeyCode.KeyO, () =>
    insertChunk(editor, "ojs")
  );
};

export const insertChunk = (
  editor: editor.IStandaloneCodeEditor,
  language: string = "r"
) => {
  const position = editor.getPosition();
  if (position) {
    const range = new Range(
      position.lineNumber,
      position.column,
      position.lineNumber,
      position.column
    );

    const text = [`\`\`\`{${language}}`, "", "```"].join("\n");

    if (position) {
      editor.executeEdits("", [
        {
          range: range,
          text: text,
        },
      ]);
      editor.setPosition({ ...position, lineNumber: position.lineNumber + 1 });
    }
  }
};
