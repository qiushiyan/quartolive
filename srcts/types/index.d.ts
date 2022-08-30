interface KnitMessage {
  prefix: string;
}

interface UpdateCodeMessage {
  code: string;
}

interface ShowModalMessage {
  title: string;
  body: string;
}

interface ChunkProposalRange {
  startLineNumber: number;
  endLineNumber: number;
  startColumn: number;
  endColumn: number;
}
