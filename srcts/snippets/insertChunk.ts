import * as monaco from "monaco-editor/esm/vs/editor/editor.api";

export const createChunkProposals = (range: ChunkProposalRange) => {
  // returning a static list of proposals, not even looking at the prefix (filtering is done by the Monaco editor),
  // here you could do a server side lookup
  return [
    {
      label: '"r-code-chunk"',
      kind: monaco.languages.CompletionItemKind.Function,
      documentation: "Insert R code chunk",
      insertText: "```{r}\n${1}\n```",
      insertTextRules:
        monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
      range: range,
    },
    {
      label: '"python-code-chunk"',
      kind: monaco.languages.CompletionItemKind.Function,
      documentation: "Insert Python code chunk",
      insertText: "```{python}\n${1}\n```",
      insertTextRules:
        monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
      range: range,
    },
    {
      label: '"julia-code-chunk"',
      kind: monaco.languages.CompletionItemKind.Function,
      documentation: "Insert Julia code chunk",
      insertText: "```{julia}\n${1}\n```",
      insertTextRules:
        monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
      range: range,
    },
    {
      label: '"ojs-code-chunk"',
      kind: monaco.languages.CompletionItemKind.Function,
      documentation: "Insert Observable Javascript code chunk",
      insertText: "```{ojs}\n${1}\n```",
      insertTextRules:
        monaco.languages.CompletionItemInsertTextRule.InsertAsSnippet,
      range: range,
    },
  ];
};
