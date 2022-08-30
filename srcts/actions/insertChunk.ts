import { editor, Range } from "monaco-editor/esm/vs/editor/editor.api";

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
