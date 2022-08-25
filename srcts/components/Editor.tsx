import React, { useState, useRef } from "react";
import Editor from "@monaco-editor/react";

const QuartoEditor: React.FC = () => {
  const monacoRef = useRef(null);

  function handleEditorWillMount(monaco) {
    // here is the monaco instance
    // do something before editor is mounted
    monaco.languages.typescript.javascriptDefaults.setEagerModelSync(true);
  }

  function handleEditorDidMount(editor, monaco) {
    // here is another way to get monaco instance
    // you can also store it in `useRef` for further usage
    monacoRef.current = editor;
  }

  return (
    <Editor
      height="90vh"
      defaultLanguage="typescript"
      defaultValue="// some comment"
      beforeMount={handleEditorWillMount}
      onMount={handleEditorDidMount}
    />
  );
};
export default QuartoEditor;
