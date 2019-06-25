#!/usr/bin/env bash

if grep -q 'if (sf\[`redirectInfo`\]) { sf = sf\[`redirectInfo`\].redirectTarget; }' node_modules/@angular/compiler-cli/src/ngtsc/typecheck/src/context.js; then
  echo "Compiler-cli already fixed"
else
  sed -i '/var sf = this.transform(originalSf);/a if (sf[`redirectInfo`]) { sf = sf[`redirectInfo`].redirectTarget; }' node_modules/@angular/compiler-cli/src/ngtsc/typecheck/src/context.js
  echo "Compiler-cli fixed"
fi
