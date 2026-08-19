#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 100G
fetcher_git 'freecodecamp-freecodecamp' 'https://github.com/freeCodeCamp/freeCodeCamp.git' 'f67426be7505cdb3072c72b3d254888e2bbaacd6' 'f67426be7505cdb3072c72b3d254888e2bbaacd6' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'react-react' 'https://github.com/react/react.git' '2042572329425f9ebf35ae6287ea5bab72b2c497' '2042572329425f9ebf35ae6287ea5bab72b2c497' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'thealgorithms-python' 'https://github.com/TheAlgorithms/Python.git' 'f5988cc09713315817df6a7e327e258013a94440' 'f5988cc09713315817df6a7e327e258013a94440' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'vuejs-vue' 'https://github.com/vuejs/vue.git' '9e88707940088cb1f4cd7dd210c9168a50dc347c' '9e88707940088cb1f4cd7dd210c9168a50dc347c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'trekhleb-javascript-algorithms' 'https://github.com/trekhleb/javascript-algorithms.git' '85293e3e2b88f4d2ce330d956b139cf628aa1e82' '85293e3e2b88f4d2ce330d956b139cf628aa1e82' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ohmyzsh-ohmyzsh' 'https://github.com/ohmyzsh/ohmyzsh.git' '99aaf58d007f1378d1e0609bcd9baf8abbbaf327' '99aaf58d007f1378d1e0609bcd9baf8abbbaf327' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'microsoft-vscode' 'https://github.com/microsoft/vscode.git' '97f9937a4263a283f83868783cf93142d1389c16' '97f9937a4263a283f83868783cf93142d1389c16' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'flutter-flutter' 'https://github.com/flutter/flutter.git' 'bea08b59e4d67d3deefe621b669bbcda3b396fe3' 'bea08b59e4d67d3deefe621b669bbcda3b396fe3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ollama-ollama' 'https://github.com/ollama/ollama.git' 'b880b76c4308cd5a97cbef2ef86367d126d77f75' 'b880b76c4308cd5a97cbef2ef86367d126d77f75' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'microsoft-markitdown' 'https://github.com/microsoft/markitdown.git' 'fd239d5d2be43d9b68329730206b9312c7d5a388' 'fd239d5d2be43d9b68329730206b9312c7d5a388' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'snailclimb-javaguide' 'https://github.com/Snailclimb/JavaGuide.git' '11fb08483ac066ac9d6bdb0bcc80f761379d54d4' '11fb08483ac066ac9d6bdb0bcc80f761379d54d4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'langflow-ai-langflow' 'https://github.com/langflow-ai/langflow.git' '3325c4642c489bfc2e2f4c9f3c63a32961f9581f' '3325c4642c489bfc2e2f4c9f3c63a32961f9581f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'genymobile-scrcpy' 'https://github.com/Genymobile/scrcpy.git' '2926c06c5dc3064ae6d8db706f1a98a37cfcf3f0' '2926c06c5dc3064ae6d8db706f1a98a37cfcf3f0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'langchain-ai-langchain' 'https://github.com/langchain-ai/langchain.git' 'd048fbe170573b6e7056b5ef5f78d8451e54abaf' 'd048fbe170573b6e7056b5ef5f78d8451e54abaf' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'microsoft-powertoys' 'https://github.com/microsoft/PowerToys.git' '9e12b7a8eed2cb693d3e6b293cd601675e76a4b0' '9e12b7a8eed2cb693d3e6b293cd601675e76a4b0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'golang-go' 'https://github.com/golang/go.git' '42a6439b1241906746e0a5d68ee6a6318813fa49' '42a6439b1241906746e0a5d68ee6a6318813fa49' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'excalidraw-excalidraw' 'https://github.com/excalidraw/excalidraw.git' 'cf212b2f3354c09bd6f960b53a9cfb0a3ecbfa58' 'cf212b2f3354c09bd6f960b53a9cfb0a3ecbfa58' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'react-react-native' 'https://github.com/react/react-native.git' '4bf9d4e9b079a3b77842727c68b82f55415898ac' '4bf9d4e9b079a3b77842727c68b82f55415898ac' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'kubernetes-kubernetes' 'https://github.com/kubernetes/kubernetes.git' '94c136764292cc5fac976c0de6587daaea56410f' '94c136764292cc5fac976c0de6587daaea56410f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ggml-org-llama.cpp' 'https://github.com/ggml-org/llama.cpp.git' '7ba604f1cb61cd14898138e9abc0b4ff2601f180' '7ba604f1cb61cd14898138e9abc0b4ff2601f180' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'electron-electron' 'https://github.com/electron/electron.git' '50b779bde5478548df30229d81dd1a12e3434c85' '50b779bde5478548df30229d81dd1a12e3434c85' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'shadcn-ui-ui' 'https://github.com/shadcn-ui/ui.git' '6261bd89f72d794aea491482cc2acfd8dc3d63e2' '6261bd89f72d794aea491482cc2acfd8dc3d63e2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'rust-lang-rust' 'https://github.com/rust-lang/rust.git' '4667d75565e47ba5df36c0df598c556b543e8624' '4667d75565e47ba5df36c0df598c556b543e8624' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'godotengine-godot' 'https://github.com/godotengine/godot.git' '4173760fdf6c2c722e82e08cb58e55f34c9efd80' '4173760fdf6c2c722e82e08cb58e55f34c9efd80' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mrdoob-three.js' 'https://github.com/mrdoob/three.js.git' '98fbdb4a5ca8f095554e5ea58b8f58c8cbc35aac' '98fbdb4a5ca8f095554e5ea58b8f58c8cbc35aac' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'tauri-apps-tauri' 'https://github.com/tauri-apps/tauri.git' '34ec18ba5e1acabebd66ae79d6fc746f63d8eb96' '34ec18ba5e1acabebd66ae79d6fc746f63d8eb96' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'axios-axios' 'https://github.com/axios/axios.git' 'f5e83e49ee32b1004db82dad2b14d1e273a99e07' 'f5e83e49ee32b1004db82dad2b14d1e273a99e07' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'fatedier-frp' 'https://github.com/fatedier/frp.git' 'd1928f968938e4f1b3b72fd12d581342e57a5030' 'd1928f968938e4f1b3b72fd12d581342e57a5030' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'browser-use-browser-use' 'https://github.com/browser-use/browser-use.git' '32601887cfbc9f4f1e3cad3e2b678e56aeaeaae4' '32601887cfbc9f4f1e3cad3e2b678e56aeaeaae4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'denoland-deno' 'https://github.com/denoland/deno.git' '98dc759254a90b98f7bbb62ba5361e531d0db6a5' '98dc759254a90b98f7bbb62ba5361e531d0db6a5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'openai-whisper' 'https://github.com/openai/whisper.git' '5f86d1d86363843179951550570367b37c5d6f78' '5f86d1d86363843179951550570367b37c5d6f78' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'microsoft-terminal' 'https://github.com/microsoft/terminal.git' 'b888cb7e4c3b0b21b7ed66c224bcdf7fa9ef6d9a' 'b888cb7e4c3b0b21b7ed66c224bcdf7fa9ef6d9a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'deepseek-ai-deepseek-v3' 'https://github.com/deepseek-ai/DeepSeek-V3.git' '9b4e9788e4a3a731f7567338ed15d3ec549ce03b' '9b4e9788e4a3a731f7567338ed15d3ec549ce03b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'react-create-react-app' 'https://github.com/react/create-react-app.git' '6254386531d263688ccfa542d0e628fbc0de0b28' '6254386531d263688ccfa542d0e628fbc0de0b28' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'harry0703-moneyprinterturbo' 'https://github.com/harry0703/MoneyPrinterTurbo.git' 'e14dea5578bb2154480b6bc436009eaa9987f0e3' 'e14dea5578bb2154480b6bc436009eaa9987f0e3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'fastapi-fastapi' 'https://github.com/fastapi/fastapi.git' '0c2b6aafd7a2e3a5bf1055ea0ed0a41da15ba5f4' '0c2b6aafd7a2e3a5bf1055ea0ed0a41da15ba5f4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'angular-angular' 'https://github.com/angular/angular.git' '565dbb2fe5406f2a86d43a5b3c6993434b7124a7' '565dbb2fe5406f2a86d43a5b3c6993434b7124a7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ant-design-ant-design' 'https://github.com/ant-design/ant-design.git' '41ba18cfc3d8a0f37ab89e143fed27d341f320d0' '41ba18cfc3d8a0f37ab89e143fed27d341f320d0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mui-material-ui' 'https://github.com/mui/material-ui.git' '81e94061ca393d4eaf238e6f77c283b2edd9ef7e' '81e94061ca393d4eaf238e6f77c283b2edd9ef7e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nvbn-thefuck' 'https://github.com/nvbn/thefuck.git' 'c7e7e1d884d3bb241ea6448f72a989434c2a35ec' 'c7e7e1d884d3bb241ea6448f72a989434c2a35ec' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'tailwindlabs-tailwindcss' 'https://github.com/tailwindlabs/tailwindcss.git' '46df7ee2fc4ae822d414d35bbd48be024e5cb1c0' '46df7ee2fc4ae822d414d35bbd48be024e5cb1c0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'tauricresearch-tradingagents' 'https://github.com/TauricResearch/TradingAgents.git' 'a33fd4c0f134485a43553a2c23a63cb14adbd88f' 'a33fd4c0f134485a43553a2c23a63cb14adbd88f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'puppeteer-puppeteer' 'https://github.com/puppeteer/puppeteer.git' '566e6a9cffb9678e20e9ec9a4cc1be343a7ac94f' '566e6a9cffb9678e20e9ec9a4cc1be343a7ac94f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nvm-sh-nvm' 'https://github.com/nvm-sh/nvm.git' '65ded65d46c16481dbbe8e93f8ba9e6b35f20740' '65ded65d46c16481dbbe8e93f8ba9e6b35f20740' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'microsoft-playwright' 'https://github.com/microsoft/playwright.git' 'c973356ee9e3906260f60da5e3e04442e069a0d4' 'c973356ee9e3906260f60da5e3e04442e069a0d4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'opencv-opencv' 'https://github.com/opencv/opencv.git' '77dfa297d08fdecdc509fc01ad92a2e9ec776a57' '77dfa297d08fdecdc509fc01ad92a2e9ec776a57' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'panjiachen-vue-element-admin' 'https://github.com/PanJiaChen/vue-element-admin.git' '6858a9ad67483025f6a9432a926beb9327037be3' '6858a9ad67483025f6a9432a926beb9327037be3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'louislam-uptime-kuma' 'https://github.com/louislam/uptime-kuma.git' '77d1a0c57a37a4cf5657bb7b514b4e08d455928e' '77d1a0c57a37a4cf5657bb7b514b4e08d455928e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bitcoin-bitcoin' 'https://github.com/bitcoin/bitcoin.git' '128456b62d5e38abea031f97f823d5b28aef9357' '128456b62d5e38abea031f97f823d5b28aef9357' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'home-assistant-core' 'https://github.com/home-assistant/core.git' 'c369f973abfcfba865a745a1750c0fe887e98d60' 'c369f973abfcfba865a745a1750c0fe887e98d60' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mermaid-js-mermaid' 'https://github.com/mermaid-js/mermaid.git' '3d521b1ee5fc9079fe0659e776a1b2cdc37174b1' '3d521b1ee5fc9079fe0659e776a1b2cdc37174b1' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gohugoio-hugo' 'https://github.com/gohugoio/hugo.git' '44da086082a1dff487f4e5639bb03a65d9dd1ade' '44da086082a1dff487f4e5639bb03a65d9dd1ade' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git '3b1b-manim' 'https://github.com/3b1b/manim.git' '01030ac5d23bc294ccb93cbfcda260f2d20dda62' '01030ac5d23bc294ccb93cbfcda260f2d20dda62' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gin-gonic-gin' 'https://github.com/gin-gonic/gin.git' '34dac209ffb6ef85cc78c5d217bbb7ad001d68fd' '34dac209ffb6ef85cc78c5d217bbb7ad001d68fd' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'chatgptnextweb-nextchat' 'https://github.com/ChatGPTNextWeb/NextChat.git' '706a18b95b714ab29b2a4842d3b9ff4f887935d5' '706a18b95b714ab29b2a4842d3b9ff4f887935d5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sherlock-project-sherlock' 'https://github.com/sherlock-project/sherlock.git' '9100f9d40a3274bd46f4ce903c5c6fee6f3745bc' '9100f9d40a3274bd46f4ce903c5c6fee6f3745bc' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'vllm-project-vllm' 'https://github.com/vllm-project/vllm.git' 'cb1a52aee3b31c692a6629ebd7ff5503b3cd13f7' 'cb1a52aee3b31c692a6629ebd7ff5503b3cd13f7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'astral-sh-uv' 'https://github.com/astral-sh/uv.git' 'dd0584d560a4693b5713a78be54304123ada3e77' 'dd0584d560a4693b5713a78be54304123ada3e77' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'django-django' 'https://github.com/django/django.git' 'c9eb16a87e60c305fb3651459639f647cce498db' 'c9eb16a87e60c305fb3651459639f647cce498db' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sveltejs-svelte' 'https://github.com/sveltejs/svelte.git' '26786e92985842a6d563c67049a43bc5857bf792' '26786e92985842a6d563c67049a43bc5857bf792' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'paddlepaddle-paddleocr' 'https://github.com/PaddlePaddle/PaddleOCR.git' '2661c7c0ef5c613e8f93c6e93b2e052399f0f854' '2661c7c0ef5c613e8f93c6e93b2e052399f0f854' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'localsend-localsend' 'https://github.com/localsend/localsend.git' 'ff2995c9523c5fae407f7d444d0986b2c6ae568e' 'ff2995c9523c5fae407f7d444d0986b2c6ae568e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'infiniflow-ragflow' 'https://github.com/infiniflow/ragflow.git' '99110c2df0d4822bd819eda36e4d038c33391123' '99110c2df0d4822bd819eda36e4d038c33391123' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'macrozheng-mall' 'https://github.com/macrozheng/mall.git' '0504e86b1f1b6f1b8aa6a734d37a90fb67346be7' '0504e86b1f1b6f1b8aa6a734d37a90fb67346be7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'openhands-openhands' 'https://github.com/OpenHands/OpenHands.git' '4470813ce58f5ac384e3d367d34518e10106526b' '4470813ce58f5ac384e3d367d34518e10106526b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'junegunn-fzf' 'https://github.com/junegunn/fzf.git' '715d26fa3949c9a0f1e41fcbda5440f3ac338e51' '715d26fa3949c9a0f1e41fcbda5440f3ac338e51' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'vitejs-vite' 'https://github.com/vitejs/vite.git' '57fea001d154e7dd8d5d74d3082731f1dcfd31be' '57fea001d154e7dd8d5d74d3082731f1dcfd31be' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'spring-projects-spring-boot' 'https://github.com/spring-projects/spring-boot.git' 'ee3c48d00ffa6efda14e730c02ba145dc15e0fe4' 'ee3c48d00ffa6efda14e730c02ba145dc15e0fe4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jesseduffield-lazygit' 'https://github.com/jesseduffield/lazygit.git' 'ddceff696286811d2adc02e27bad1b275b9b1c75' 'ddceff696286811d2adc02e27bad1b275b9b1c75' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'hoppscotch-hoppscotch' 'https://github.com/hoppscotch/hoppscotch.git' '1acb8a3a7581e4db32ba0d529170c4669a2e1053' '1acb8a3a7581e4db32ba0d529170c4669a2e1053' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'anuraghazra-github-readme-stats' 'https://github.com/anuraghazra/github-readme-stats.git' '54a7985aeefda00d5eadb55b80c17c7f976c37d2' '54a7985aeefda00d5eadb55b80c17c7f976c37d2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'd2l-ai-d2l-zh' 'https://github.com/d2l-ai/d2l-zh.git' 'e6b18ccea71451a55fcd861d7b96fddf2587b09a' 'e6b18ccea71451a55fcd861d7b96fddf2587b09a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'z4nzu-hackingtool' 'https://github.com/Z4nzu/hackingtool.git' '9b92b6156ddc5ff87bf0fa592d81c333a88d1c78' '9b92b6156ddc5ff87bf0fa592d81c333a88d1c78' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'coder-code-server' 'https://github.com/coder/code-server.git' '313bf0359b4d391ba18f1fa131aad8a583bc2919' '313bf0359b4d391ba18f1fa131aad8a583bc2919' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nomic-ai-gpt4all' 'https://github.com/nomic-ai/gpt4all.git' 'b666d16db5aeab8b91aaf7963adcee9c643734d7' 'b666d16db5aeab8b91aaf7963adcee9c643734d7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'unclecode-crawl4ai' 'https://github.com/unclecode/crawl4ai.git' '7e801521428ee12509994d39151006f64055ebe3' '7e801521428ee12509994d39151006f64055ebe3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nestjs-nest' 'https://github.com/nestjs/nest.git' 'c3bc75c973813969aa676793e20a7cba12a9daf5' 'c3bc75c973813969aa676793e20a7cba12a9daf5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'tesseract-ocr-tesseract' 'https://github.com/tesseract-ocr/tesseract.git' '64ed93b68c01f359d924fc1bfcf0d5931eb77211' '64ed93b68c01f359d924fc1bfcf0d5931eb77211' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'typicode-json-server' 'https://github.com/typicode/json-server.git' '89a34a44b7a6a5311dc84f3b8a1b8b45c0905aea' '89a34a44b7a6a5311dc84f3b8a1b8b45c0905aea' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ocornut-imgui' 'https://github.com/ocornut/imgui.git' '46d39d56febc2a00bdd2270dc88c8a13f2a0441a' '46d39d56febc2a00bdd2270dc88c8a13f2a0441a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'caddyserver-caddy' 'https://github.com/caddyserver/caddy.git' '64b64c61ebc40ea37280b2baa1a7a492cc1156c5' '64b64c61ebc40ea37280b2baa1a7a492cc1156c5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'apache-superset' 'https://github.com/apache/superset.git' '3b164e4270860ac07223d4df1a60ca7b56312362' '3b164e4270860ac07223d4df1a60ca7b56312362' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'hiyouga-llamafactory' 'https://github.com/hiyouga/LlamaFactory.git' '887b850813d80a8d893ec56703d5b3a0eec46de6' '887b850813d80a8d893ec56703d5b3a0eec46de6' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'abi-screenshot-to-code' 'https://github.com/abi/screenshot-to-code.git' 'd026163f586dfa8c5c10d28c36edd59a9d3b0e88' 'd026163f586dfa8c5c10d28c36edd59a9d3b0e88' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'unionlabs-union' 'https://github.com/unionlabs/union.git' '031785bb6dc6b957c624e62bc64c184409c97d7b' '031785bb6dc6b957c624e62bc64c184409c97d7b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'eugeny-tabby' 'https://github.com/Eugeny/tabby.git' '14e2d60b9b6dee84a53c37f05eefeb803787de04' '14e2d60b9b6dee84a53c37f05eefeb803787de04' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'd4vinci-scrapling' 'https://github.com/D4Vinci/Scrapling.git' '39847bd2da41f8e089593f91016d81d3a4771e6f' '39847bd2da41f8e089593f91016d81d3a4771e6f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'pallets-flask' 'https://github.com/pallets/flask.git' '6a2f545bfd8ed31e19066a299296917e034aca58' '6a2f545bfd8ed31e19066a299296917e034aca58' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nationalsecurityagency-ghidra' 'https://github.com/NationalSecurityAgency/ghidra.git' '291d5c4e77735b0b4b40613d952ecdd157ef750b' '291d5c4e77735b0b4b40613d952ecdd157ef750b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'moby-moby' 'https://github.com/moby/moby.git' 'e456107947c1d554ae1ad0645ed6e13978aa1c2d' 'e456107947c1d554ae1ad0645ed6e13978aa1c2d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'swiftlang-swift' 'https://github.com/swiftlang/swift.git' 'e2bbdd321e85cf8a54c253c1d7cfbf495103e6f7' 'e2bbdd321e85cf8a54c253c1d7cfbf495103e6f7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'unslothai-unsloth' 'https://github.com/unslothai/unsloth.git' '2a56df02e6a00ea2496169fe0ef6dc2d9ea9c3a5' '2a56df02e6a00ea2496169fe0ef6dc2d9ea9c3a5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'openinterpreter-openinterpreter' 'https://github.com/openinterpreter/openinterpreter.git' '984acc698cd038885ecb0b82721402b01e11a5ad' '984acc698cd038885ecb0b82721402b01e11a5ad' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'apache-echarts' 'https://github.com/apache/echarts.git' '30076aedcd7b7f65d8dd8e8d9ece46ce778133a3' '30076aedcd7b7f65d8dd8e8d9ece46ce778133a3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'cline-cline' 'https://github.com/cline/cline.git' '45403900964a74aa5ae3683a0e61b535600b97e0' '45403900964a74aa5ae3683a0e61b535600b97e0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'prometheus-prometheus' 'https://github.com/prometheus/prometheus.git' '5542b00b9d5933e29d7b597705c718b764bcc1cb' '5542b00b9d5933e29d7b597705c718b764bcc1cb' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'alacritty-alacritty' 'https://github.com/alacritty/alacritty.git' '1b2b36a64e88068ad02c95fad00ee2fad31c00bf' '1b2b36a64e88068ad02c95fad00ee2fad31c00bf' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ladybirdbrowser-ladybird' 'https://github.com/LadybirdBrowser/ladybird.git' '8d225a329ee852510b4522e04d357c6fdd51d7f7' '8d225a329ee852510b4522e04d357c6fdd51d7f7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'scrapy-scrapy' 'https://github.com/scrapy/scrapy.git' '1bd839b57ddb614664a179b6213f49579bdfd3da' '1bd839b57ddb614664a179b6213f49579bdfd3da' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mem0ai-mem0' 'https://github.com/mem0ai/mem0.git' '4debc58a83377b18be81ae1e5969a300736b2fac' '4debc58a83377b18be81ae1e5969a300736b2fac' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jgraph-drawio-desktop' 'https://github.com/jgraph/drawio-desktop.git' '403a2cb79f431db13a395f033b67eeebc1631754' '403a2cb79f431db13a395f033b67eeebc1631754' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'fuellabs-sway' 'https://github.com/FuelLabs/sway.git' '91be236f71fbb541ee6639ef0d955b2b8cf0a658' '91be236f71fbb541ee6639ef0d955b2b8cf0a658' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'coollabsio-coolify' 'https://github.com/coollabsio/coolify.git' '940571e16f5a0e6c73cf56b4bb1184bed3d60623' '940571e16f5a0e6c73cf56b4bb1184bed3d60623' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'spring-projects-spring-framework' 'https://github.com/spring-projects/spring-framework.git' 'da4b31c82b567a0531c6980b5172cba1fc7e6ed5' 'da4b31c82b567a0531c6980b5172cba1fc7e6ed5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sharkdp-bat' 'https://github.com/sharkdp/bat.git' '2ba8db9c14e5794572f5ea338c2b90404c9769cb' '2ba8db9c14e5794572f5ea338c2b90404c9769cb' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'filosottile-mkcert' 'https://github.com/FiloSottile/mkcert.git' '1c1dc4ed27ed5936046b6398d39cab4d657a2d8e' '1c1dc4ed27ed5936046b6398d39cab4d657a2d8e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'appwrite-appwrite' 'https://github.com/appwrite/appwrite.git' '5d1e08464b2e5785cb21c1eef4604f904788fbb5' '5d1e08464b2e5785cb21c1eef4604f904788fbb5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'typst-typst' 'https://github.com/typst/typst.git' 'a51e028041cac426f97d34335bb01d8f1d8e5e8f' 'a51e028041cac426f97d34335bb01d8f1d8e5e8f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jingyaogong-minimind' 'https://github.com/jingyaogong/minimind.git' '393e387e9ad99f0f04c296e4c5e7353f4444629f' '393e387e9ad99f0f04c296e4c5e7353f4444629f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'psf-requests' 'https://github.com/psf/requests.git' '1f6589ec3a1ee910f9a65cc3ceac60b26677bc0e' '1f6589ec3a1ee910f9a65cc3ceac60b26677bc0e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mozilla-pdf.js' 'https://github.com/mozilla/pdf.js.git' '022e9588728346cde58088a9925120293af1c8f4' '022e9588728346cde58088a9925120293af1c8f4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lyswhut-lx-music-desktop' 'https://github.com/lyswhut/lx-music-desktop.git' '9c364b482e5621a1d38b50e8610d2fb974457e6e' '9c364b482e5621a1d38b50e8610d2fb974457e6e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'aaif-goose-goose' 'https://github.com/aaif-goose/goose.git' '064244e6bddf641876676f054a006b7da1da5182' '064244e6bddf641876676f054a006b7da1da5182' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xai-org-grok-1' 'https://github.com/xai-org/grok-1.git' '7050ed204b8206bb8645c7b7bbef7252f79561b0' '7050ed204b8206bb8645c7b7bbef7252f79561b0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'etcd-io-etcd' 'https://github.com/etcd-io/etcd.git' '5b75ac62cf042a185e902530c25fd3d59c095232' '5b75ac62cf042a185e902530c25fd3d59c095232' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'google-guava' 'https://github.com/google/guava.git' '0a8e1ec55afe1d9361ebbd0c4149adfbb32ccf9a' '0a8e1ec55afe1d9361ebbd0c4149adfbb32ccf9a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'dbeaver-dbeaver' 'https://github.com/dbeaver/dbeaver.git' 'b2122ee6c4bdf914af3f13d42a603a3ab2d25bc0' 'b2122ee6c4bdf914af3f13d42a603a3ab2d25bc0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'skylot-jadx' 'https://github.com/skylot/jadx.git' 'e738a26571d02919f01df40de93bc9a44dee4e18' 'e738a26571d02919f01df40de93bc9a44dee4e18' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'pandas-dev-pandas' 'https://github.com/pandas-dev/pandas.git' 'ff1d39bbdf4eda26de2285cf836104f9885b0826' 'ff1d39bbdf4eda26de2285cf836104f9885b0826' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'homebrew-brew' 'https://github.com/Homebrew/brew.git' '749b3557ccebae4ecd79f17aa2527d2f68acc739' '749b3557ccebae4ecd79f17aa2527d2f68acc739' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'reactivex-rxjava' 'https://github.com/ReactiveX/RxJava.git' '8f7b841984133e2a3ba88630779af9e66248ff95' '8f7b841984133e2a3ba88630779af9e66248ff95' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'aider-ai-aider' 'https://github.com/Aider-AI/aider.git' '5dc9490bb35f9729ef2c95d00a19ccd30c26339c' '5dc9490bb35f9729ef2c95d00a19ccd30c26339c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'prisma-prisma' 'https://github.com/prisma/prisma.git' 'd55cd02911b0c6675bedaad90cc0e2727d5787ce' 'd55cd02911b0c6675bedaad90cc0e2727d5787ce' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bevyengine-bevy' 'https://github.com/bevyengine/bevy.git' 'e8b3598ff5e5ec40e8ba84edd5750a1c0e4d4e59' 'e8b3598ff5e5ec40e8ba84edd5750a1c0e4d4e59' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'slab-quill' 'https://github.com/slab/quill.git' '539cbffd0a13b18e9c65eb84dd35e6596e403158' '539cbffd0a13b18e9c65eb84dd35e6596e403158' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lysine-dev-okhttp' 'https://github.com/lysine-dev/okhttp.git' 'fc9a83dd580f06c52beea5207ffca1a7d99df24e' 'fc9a83dd580f06c52beea5207ffca1a7d99df24e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'exo-explore-exo' 'https://github.com/exo-explore/exo.git' 'b5375f8cee4368d09e1ce96a56b9f81fb0bc81aa' 'b5375f8cee4368d09e1ce96a56b9f81fb0bc81aa' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'apache-airflow' 'https://github.com/apache/airflow.git' '1f529f3837ab5e38ddd27ea355a7fbfddd392573' '1f529f3837ab5e38ddd27ea355a7fbfddd392573' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'android-architecture-samples' 'https://github.com/android/architecture-samples.git' 'ee66e1526b84c026615df032c705842b7d2a521f' 'ee66e1526b84c026615df032c705842b7d2a521f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'google-zx' 'https://github.com/google/zx.git' '00a2c484e219c2e84bfc3a199febf7fbce2cfbf4' '00a2c484e219c2e84bfc3a199febf7fbce2cfbf4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'milvus-io-milvus' 'https://github.com/milvus-io/milvus.git' '025d2e3e75d38f4edd8d5b8536d514e777a47559' '025d2e3e75d38f4edd8d5b8536d514e777a47559' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'streamlit-streamlit' 'https://github.com/streamlit/streamlit.git' '97eada51b426a81884955906d75407d1270545f9' '97eada51b426a81884955906d75407d1270545f9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'leaflet-leaflet' 'https://github.com/Leaflet/Leaflet.git' 'c96f31a7a350a07cfbc852cf88e6ca69af5f5ec9' 'c96f31a7a350a07cfbc852cf88e6ca69af5f5ec9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'grpc-grpc' 'https://github.com/grpc/grpc.git' 'b6449efc3e9968eb022a2cf7a043b4317adde589' 'b6449efc3e9968eb022a2cf7a043b4317adde589' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'spf13-cobra' 'https://github.com/spf13/cobra.git' 'adbc8813901bba65827259daa8e22ff94ec1f30e' 'adbc8813901bba65827259daa8e22ff94ec1f30e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'aykutsarac-jsoncrack.com' 'https://github.com/AykutSarac/jsoncrack.com.git' '3c9af69e23c635356293b6b28cf4cd0af10d1059' '3c9af69e23c635356293b6b28cf4cd0af10d1059' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sharkdp-fd' 'https://github.com/sharkdp/fd.git' '0f1f9676dcf7bc5af814469a74a0d878449cde80' '0f1f9676dcf7bc5af814469a74a0d878449cde80' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'kong-kong' 'https://github.com/Kong/kong.git' 'fa9c3b695af72668f135cb17bbb84a8b4dc511d2' 'fa9c3b695af72668f135cb17bbb84a8b4dc511d2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lysine-dev-retrofit' 'https://github.com/lysine-dev/retrofit.git' 'd0b112dad073b7fe49c953ebc46ff1b424cb1e51' 'd0b112dad073b7fe49c953ebc46ff1b424cb1e51' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'apache-spark' 'https://github.com/apache/spark.git' 'f896d8d0d40a859f0c40ef99dac3fb2bba5035e7' 'f896d8d0d40a859f0c40ef99dac3fb2bba5035e7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ray-project-ray' 'https://github.com/ray-project/ray.git' '12436ea75080433a9134cfa362b3dbb98fe9e73f' '12436ea75080433a9134cfa362b3dbb98fe9e73f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'juspay-hyperswitch' 'https://github.com/juspay/hyperswitch.git' '77c45d76b2b70a5b127d11a6b6755d2793b021f9' '77c45d76b2b70a5b127d11a6b6755d2793b021f9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'fuellabs-fuels-rs' 'https://github.com/FuelLabs/fuels-rs.git' 'd9a250a51818dda64bfeb5ef7cc19cf27bdcd623' 'd9a250a51818dda64bfeb5ef7cc19cf27bdcd623' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'juanfont-headscale' 'https://github.com/juanfont/headscale.git' '565fd254d06c4c7f9a8cad1714a43445c79ba420' '565fd254d06c4c7f9a8cad1714a43445c79ba420' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'php-php-src' 'https://github.com/php/php-src.git' 'b9b44872d72dc66bcea72232a2bc79a3b63a0c3b' 'b9b44872d72dc66bcea72232a2bc79a3b63a0c3b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'google-leveldb' 'https://github.com/google/leveldb.git' '7ee830d02b623e8ffe0b95d59a74db1e58da04c5' '7ee830d02b623e8ffe0b95d59a74db1e58da04c5' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'google-googletest' 'https://github.com/google/googletest.git' 'd89aac5f0dd4021198d903d39de16f896726de21' 'd89aac5f0dd4021198d903d39de16f896726de21' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'httpie-cli' 'https://github.com/httpie/cli.git' '5b604c37c6c67e18e7c3e9aee6c88a8c22b98345' '5b604c37c6c67e18e7c3e9aee6c88a8c22b98345' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'hyprwm-hyprland' 'https://github.com/hyprwm/Hyprland.git' '5dee44a72476be67789f64e6c6bffae0df28c53a' '5dee44a72476be67789f64e6c6bffae0df28c53a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xinntao-real-esrgan' 'https://github.com/xinntao/Real-ESRGAN.git' 'a4abfb2979a7bbff3f69f58f58ae324608821e27' 'a4abfb2979a7bbff3f69f58f58ae324608821e27' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'restic-restic' 'https://github.com/restic/restic.git' 'a80be1478a4c537f8396e0db2b05120aa78f11e0' 'a80be1478a4c537f8396e0db2b05120aa78f11e0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'tailscale-tailscale' 'https://github.com/tailscale/tailscale.git' 'e592a0c36398be8a435d1cc9e039c732c540051c' 'e592a0c36398be8a435d1cc9e039c732c540051c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'serenityos-serenity' 'https://github.com/SerenityOS/serenity.git' '93af8693d6868799635ff0bee2b7ca30746f39a9' '93af8693d6868799635ff0bee2b7ca30746f39a9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nginx-nginx' 'https://github.com/nginx/nginx.git' 'dea68dbf126f40a8acd09bac885a955be459162e' 'dea68dbf126f40a8acd09bac885a955be459162e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'getredash-redash' 'https://github.com/getredash/redash.git' '2daefd2f78b270a6a566a86251d8bbd841d394d3' '2daefd2f78b270a6a566a86251d8bbd841d394d3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'fyne-io-fyne' 'https://github.com/fyne-io/fyne.git' '57f5b07179b833e781522f8a32c160312d94ede1' '57f5b07179b833e781522f8a32c160312d94ede1' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'pppscn-smsforwarder' 'https://github.com/pppscn/SmsForwarder.git' 'ce931a03739a6a2b0dfc83161bf812a94fd5e45e' 'ce931a03739a6a2b0dfc83161bf812a94fd5e45e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'valkey-io-valkey' 'https://github.com/valkey-io/valkey.git' '2d69e5e9b7c27d3a49cef67aa61ad306d107bfd1' '2d69e5e9b7c27d3a49cef67aa61ad306d107bfd1' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'kataras-iris' 'https://github.com/kataras/iris.git' '7bedaf55a0b64bbb2248a5845a2c60d81a30996a' '7bedaf55a0b64bbb2248a5845a2c60d81a30996a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'highlightjs-highlight.js' 'https://github.com/highlightjs/highlight.js.git' '4d4268d701e30b0954149e9eb3bc9c4d9e15d550' '4d4268d701e30b0954149e9eb3bc9c4d9e15d550' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'copy-v86' 'https://github.com/copy/v86.git' '6eda8ff53a7d2e0e6e3edb3c43b0a4757dcf24a6' '6eda8ff53a7d2e0e6e3edb3c43b0a4757dcf24a6' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'filosottile-age' 'https://github.com/FiloSottile/age.git' '706dfc1e799a03443ae46023502bd88d4e9e324f' '706dfc1e799a03443ae46023502bd88d4e9e324f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'zsh-users-zsh-syntax-highlighting' 'https://github.com/zsh-users/zsh-syntax-highlighting.git' 'c4d95591843d49838b7ad30081e7aba3135a6703' 'c4d95591843d49838b7ad30081e7aba3135a6703' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'redis-go-redis' 'https://github.com/redis/go-redis.git' '36d97525cd8076aed67cddf54778e9ea84550929' '36d97525cd8076aed67cddf54778e9ea84550929' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'homebrew-homebrew-cask' 'https://github.com/Homebrew/homebrew-cask.git' 'a5ae7dad7f4d23844499bf4ac502ecbe382b0e9b' 'a5ae7dad7f4d23844499bf4ac502ecbe382b0e9b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gorilla-mux' 'https://github.com/gorilla/mux.git' 'db9d1d0073d27a0a2d9a8c1bc52aa0af4374d265' 'db9d1d0073d27a0a2d9a8c1bc52aa0af4374d265' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jarun-nnn' 'https://github.com/jarun/nnn.git' '53fdae65eef6cb35afaf1e1c2abef3242f48153b' '53fdae65eef6cb35afaf1e1c2abef3242f48153b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lit-lit' 'https://github.com/lit/lit.git' 'c42ee1e96b8fd61f7256f61d715daef572e76e52' 'c42ee1e96b8fd61f7256f61d715daef572e76e52' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'qax-os-excelize' 'https://github.com/qax-os/excelize.git' 'a54c578af309fa81f448143ed2b7a91192cc58a7' 'a54c578af309fa81f448143ed2b7a91192cc58a7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'motdotla-dotenv' 'https://github.com/motdotla/dotenv.git' '2fc7eac8ad77cbd5f7814355c7fa352dbcf3c358' '2fc7eac8ad77cbd5f7814355c7fa352dbcf3c358' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bokeh-bokeh' 'https://github.com/bokeh/bokeh.git' '681880b19108a37e159b7a3d185611f04112c47b' '681880b19108a37e159b7a3d185611f04112c47b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bradlarson-gpuimage' 'https://github.com/BradLarson/GPUImage.git' '167b0389bc6e9dc4bb0121550f91d8d5d6412c53' '167b0389bc6e9dc4bb0121550f91d8d5d6412c53' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sebastianbergmann-phpunit' 'https://github.com/sebastianbergmann/phpunit.git' '6917e76ff5762f4b70203b58608f6bba360cc2c2' '6917e76ff5762f4b70203b58608f6bba360cc2c2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'grpc-ecosystem-grpc-gateway' 'https://github.com/grpc-ecosystem/grpc-gateway.git' 'c59e315f9f70e99a2dcb7a2b6ca0f9ab15b1d8be' 'c59e315f9f70e99a2dcb7a2b6ca0f9ab15b1d8be' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'antlr-antlr4' 'https://github.com/antlr/antlr4.git' '7d5770395bb7b02eb56e7c62662cb1d7c08f42a3' '7d5770395bb7b02eb56e7c62662cb1d7c08f42a3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'compiler-explorer-compiler-explorer' 'https://github.com/compiler-explorer/compiler-explorer.git' '2854ef3dfb93bd9cac85afce5a1d5c1b47093e2d' '2854ef3dfb93bd9cac85afce5a1d5c1b47093e2d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'joewalnes-websocketd' 'https://github.com/joewalnes/websocketd.git' 'd1a43cab937a6a534ca18a44b971a9eb0ea55515' 'd1a43cab937a6a534ca18a44b971a9eb0ea55515' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nikic-php-parser' 'https://github.com/nikic/PHP-Parser.git' 'fbd47f7ebcbb450138d92642a0a53b72a5285dda' 'fbd47f7ebcbb450138d92642a0a53b72a5285dda' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bkaradzic-bgfx' 'https://github.com/bkaradzic/bgfx.git' 'cb2b1edbbe8a5e5a7c7e363d650cc4000dcbe51f' 'cb2b1edbbe8a5e5a7c7e363d650cc4000dcbe51f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'weaviate-weaviate' 'https://github.com/weaviate/weaviate.git' 'e6e3aa9e89786573fa2e97baf7347a2248ed50b7' 'e6e3aa9e89786573fa2e97baf7347a2248ed50b7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'javascript-obfuscator-javascript-obfuscator' 'https://github.com/javascript-obfuscator/javascript-obfuscator.git' 'c948c1b43350fba818d7eceec6237cd2d467c8a9' 'c948c1b43350fba818d7eceec6237cd2d467c8a9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'spree-spree' 'https://github.com/spree/spree.git' '547e59959f9d8ca49b35f6aeb3f6ccecdf0ad1f8' '547e59959f9d8ca49b35f6aeb3f6ccecdf0ad1f8' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'homebrew-homebrew-core' 'https://github.com/Homebrew/homebrew-core.git' '243e5132e70af65a9179c4300fac9fcda0dbd2d2' '243e5132e70af65a9179c4300fac9fcda0dbd2d2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'kgretzky-evilginx2' 'https://github.com/kgretzky/evilginx2.git' '4c0988a1d9db4d172a185e979a38bfd0efdb5830' '4c0988a1d9db4d172a185e979a38bfd0efdb5830' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'acidanthera-opencorepkg' 'https://github.com/acidanthera/OpenCorePkg.git' '3eb5eea3729bb953517d2dc6501e8ac2cabfc3d4' '3eb5eea3729bb953517d2dc6501e8ac2cabfc3d4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jupyterlab-jupyterlab' 'https://github.com/jupyterlab/jupyterlab.git' '08b3325c4ad3a0c817e56d883612b2b167e7404c' '08b3325c4ad3a0c817e56d883612b2b167e7404c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'keycastr-keycastr' 'https://github.com/keycastr/keycastr.git' '58133a7bca58586b6fa1f462b4c13f09404f9c6a' '58133a7bca58586b6fa1f462b4c13f09404f9c6a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'puerkitobio-goquery' 'https://github.com/PuerkitoBio/goquery.git' '53a9b37ea8596a9fe2fb4bea6f5eb30d12c6bb6c' '53a9b37ea8596a9fe2fb4bea6f5eb30d12c6bb6c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'webrtc-samples' 'https://github.com/webrtc/samples.git' '6e2c5a117aa860d66d874f7c0df0ef9a3e2cd74e' '6e2c5a117aa860d66d874f7c0df0ef9a3e2cd74e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'shelljs-shelljs' 'https://github.com/shelljs/shelljs.git' 'f364da6625945414440bb15210f102ba5fc10ed9' 'f364da6625945414440bb15210f102ba5fc10ed9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'yiisoft-yii2' 'https://github.com/yiisoft/yii2.git' '66f00d18a29b520f85e8e8f1e32d1e7e7b556cac' '66f00d18a29b520f85e8e8f1e32d1e7e7b556cac' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'memcached-memcached' 'https://github.com/memcached/memcached.git' '2d51e364799bc9698bd4b11728ea978cea12da6e' '2d51e364799bc9698bd4b11728ea978cea12da6e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'app-vnext-polly' 'https://github.com/App-vNext/Polly.git' '3987bb8c0a876314ea0e29d200c333f0fdef5e53' '3987bb8c0a876314ea0e29d200c333f0fdef5e53' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'arut-nginx-rtmp-module' 'https://github.com/arut/nginx-rtmp-module.git' '6c7719d0ba32e00b563ec70bd43dad11960fa9c4' '6c7719d0ba32e00b563ec70bd43dad11960fa9c4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'vlucas-phpdotenv' 'https://github.com/vlucas/phpdotenv.git' '416df702837983f8d5ff48c9c3fee4f5f57b980b' '416df702837983f8d5ff48c9c3fee4f5f57b980b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'cocoalumberjack-cocoalumberjack' 'https://github.com/CocoaLumberjack/CocoaLumberjack.git' '91860fa9bcda881233539dcc00f40a0f61d3e6ff' '91860fa9bcda881233539dcc00f40a0f61d3e6ff' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'alibaba-tengine' 'https://github.com/alibaba/tengine.git' 'fcebbd12267b150c7e0406e8e3e5936c0b729aae' 'fcebbd12267b150c7e0406e8e3e5936c0b729aae' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'expo-create-react-native-app' 'https://github.com/expo/create-react-native-app.git' '3a7b11ee859c5c38fe09be58419e97a286a22c13' '3a7b11ee859c5c38fe09be58419e97a286a22c13' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gopherjs-gopherjs' 'https://github.com/gopherjs/gopherjs.git' '490705b1d6fc7d5bd9202ac41888e146183328eb' '490705b1d6fc7d5bd9202ac41888e146183328eb' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'node-inspector-node-inspector' 'https://github.com/node-inspector/node-inspector.git' '79e01c049286374f86dd560742a614019c02402f' '79e01c049286374f86dd560742a614019c02402f' '--skip-symlinks' '--filter-blobs' '--source-code'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "permissive",
    "title": "Permissively Licensed Project Code",
    "description": "Project-owned files from immutable open-source repository commits, with text, structured, and binary assets retained while common vendored, generated, dependency, fixture, and build-output trees are excluded.",
    "destination": "code/permissive"
  },
  "sources": [
    {
      "id": "freecodecamp-freecodecamp",
      "path": "freecodecamp-freecodecamp",
      "license": "BSD-3-Clause",
      "source": {
        "name": "freeCodeCamp/freeCodeCamp",
        "version": "f67426be7505cdb3072c72b3d254888e2bbaacd6",
        "url": "https://github.com/freeCodeCamp/freeCodeCamp",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/freeCodeCamp/freeCodeCamp/license?ref=f67426be7505cdb3072c72b3d254888e2bbaacd6",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/freeCodeCamp/freeCodeCamp.git",
          "revision": "f67426be7505cdb3072c72b3d254888e2bbaacd6",
          "ref": "f67426be7505cdb3072c72b3d254888e2bbaacd6"
        }
      ]
    },
    {
      "id": "react-react",
      "path": "react-react",
      "license": "MIT",
      "source": {
        "name": "react/react",
        "version": "2042572329425f9ebf35ae6287ea5bab72b2c497",
        "url": "https://github.com/react/react",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/react/react/license?ref=2042572329425f9ebf35ae6287ea5bab72b2c497",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/react/react.git",
          "revision": "2042572329425f9ebf35ae6287ea5bab72b2c497",
          "ref": "2042572329425f9ebf35ae6287ea5bab72b2c497"
        }
      ]
    },
    {
      "id": "thealgorithms-python",
      "path": "thealgorithms-python",
      "license": "MIT",
      "source": {
        "name": "TheAlgorithms/Python",
        "version": "f5988cc09713315817df6a7e327e258013a94440",
        "url": "https://github.com/TheAlgorithms/Python",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/TheAlgorithms/Python/license?ref=f5988cc09713315817df6a7e327e258013a94440",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/TheAlgorithms/Python.git",
          "revision": "f5988cc09713315817df6a7e327e258013a94440",
          "ref": "f5988cc09713315817df6a7e327e258013a94440"
        }
      ]
    },
    {
      "id": "vuejs-vue",
      "path": "vuejs-vue",
      "license": "MIT",
      "source": {
        "name": "vuejs/vue",
        "version": "9e88707940088cb1f4cd7dd210c9168a50dc347c",
        "url": "https://github.com/vuejs/vue",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/vuejs/vue/license?ref=9e88707940088cb1f4cd7dd210c9168a50dc347c",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/vuejs/vue.git",
          "revision": "9e88707940088cb1f4cd7dd210c9168a50dc347c",
          "ref": "9e88707940088cb1f4cd7dd210c9168a50dc347c"
        }
      ]
    },
    {
      "id": "trekhleb-javascript-algorithms",
      "path": "trekhleb-javascript-algorithms",
      "license": "MIT",
      "source": {
        "name": "trekhleb/javascript-algorithms",
        "version": "85293e3e2b88f4d2ce330d956b139cf628aa1e82",
        "url": "https://github.com/trekhleb/javascript-algorithms",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/trekhleb/javascript-algorithms/license?ref=85293e3e2b88f4d2ce330d956b139cf628aa1e82",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/trekhleb/javascript-algorithms.git",
          "revision": "85293e3e2b88f4d2ce330d956b139cf628aa1e82",
          "ref": "85293e3e2b88f4d2ce330d956b139cf628aa1e82"
        }
      ]
    },
    {
      "id": "ohmyzsh-ohmyzsh",
      "path": "ohmyzsh-ohmyzsh",
      "license": "MIT",
      "source": {
        "name": "ohmyzsh/ohmyzsh",
        "version": "99aaf58d007f1378d1e0609bcd9baf8abbbaf327",
        "url": "https://github.com/ohmyzsh/ohmyzsh",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ohmyzsh/ohmyzsh/license?ref=99aaf58d007f1378d1e0609bcd9baf8abbbaf327",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Shell"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ohmyzsh/ohmyzsh.git",
          "revision": "99aaf58d007f1378d1e0609bcd9baf8abbbaf327",
          "ref": "99aaf58d007f1378d1e0609bcd9baf8abbbaf327"
        }
      ]
    },
    {
      "id": "microsoft-vscode",
      "path": "microsoft-vscode",
      "license": "MIT",
      "source": {
        "name": "microsoft/vscode",
        "version": "97f9937a4263a283f83868783cf93142d1389c16",
        "url": "https://github.com/microsoft/vscode",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/microsoft/vscode/license?ref=97f9937a4263a283f83868783cf93142d1389c16",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/microsoft/vscode.git",
          "revision": "97f9937a4263a283f83868783cf93142d1389c16",
          "ref": "97f9937a4263a283f83868783cf93142d1389c16"
        }
      ]
    },
    {
      "id": "flutter-flutter",
      "path": "flutter-flutter",
      "license": "BSD-3-Clause",
      "source": {
        "name": "flutter/flutter",
        "version": "bea08b59e4d67d3deefe621b669bbcda3b396fe3",
        "url": "https://github.com/flutter/flutter",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/flutter/flutter/license?ref=bea08b59e4d67d3deefe621b669bbcda3b396fe3",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Dart"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/flutter/flutter.git",
          "revision": "bea08b59e4d67d3deefe621b669bbcda3b396fe3",
          "ref": "bea08b59e4d67d3deefe621b669bbcda3b396fe3"
        }
      ]
    },
    {
      "id": "ollama-ollama",
      "path": "ollama-ollama",
      "license": "MIT",
      "source": {
        "name": "ollama/ollama",
        "version": "b880b76c4308cd5a97cbef2ef86367d126d77f75",
        "url": "https://github.com/ollama/ollama",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ollama/ollama/license?ref=b880b76c4308cd5a97cbef2ef86367d126d77f75",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ollama/ollama.git",
          "revision": "b880b76c4308cd5a97cbef2ef86367d126d77f75",
          "ref": "b880b76c4308cd5a97cbef2ef86367d126d77f75"
        }
      ]
    },
    {
      "id": "microsoft-markitdown",
      "path": "microsoft-markitdown",
      "license": "MIT",
      "source": {
        "name": "microsoft/markitdown",
        "version": "fd239d5d2be43d9b68329730206b9312c7d5a388",
        "url": "https://github.com/microsoft/markitdown",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/microsoft/markitdown/license?ref=fd239d5d2be43d9b68329730206b9312c7d5a388",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/microsoft/markitdown.git",
          "revision": "fd239d5d2be43d9b68329730206b9312c7d5a388",
          "ref": "fd239d5d2be43d9b68329730206b9312c7d5a388"
        }
      ]
    },
    {
      "id": "snailclimb-javaguide",
      "path": "snailclimb-javaguide",
      "license": "Apache-2.0",
      "source": {
        "name": "Snailclimb/JavaGuide",
        "version": "11fb08483ac066ac9d6bdb0bcc80f761379d54d4",
        "url": "https://github.com/Snailclimb/JavaGuide",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Snailclimb/JavaGuide/license?ref=11fb08483ac066ac9d6bdb0bcc80f761379d54d4",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Snailclimb/JavaGuide.git",
          "revision": "11fb08483ac066ac9d6bdb0bcc80f761379d54d4",
          "ref": "11fb08483ac066ac9d6bdb0bcc80f761379d54d4"
        }
      ]
    },
    {
      "id": "langflow-ai-langflow",
      "path": "langflow-ai-langflow",
      "license": "MIT",
      "source": {
        "name": "langflow-ai/langflow",
        "version": "3325c4642c489bfc2e2f4c9f3c63a32961f9581f",
        "url": "https://github.com/langflow-ai/langflow",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/langflow-ai/langflow/license?ref=3325c4642c489bfc2e2f4c9f3c63a32961f9581f",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/langflow-ai/langflow.git",
          "revision": "3325c4642c489bfc2e2f4c9f3c63a32961f9581f",
          "ref": "3325c4642c489bfc2e2f4c9f3c63a32961f9581f"
        }
      ]
    },
    {
      "id": "genymobile-scrcpy",
      "path": "genymobile-scrcpy",
      "license": "Apache-2.0",
      "source": {
        "name": "Genymobile/scrcpy",
        "version": "2926c06c5dc3064ae6d8db706f1a98a37cfcf3f0",
        "url": "https://github.com/Genymobile/scrcpy",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Genymobile/scrcpy/license?ref=2926c06c5dc3064ae6d8db706f1a98a37cfcf3f0",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Genymobile/scrcpy.git",
          "revision": "2926c06c5dc3064ae6d8db706f1a98a37cfcf3f0",
          "ref": "2926c06c5dc3064ae6d8db706f1a98a37cfcf3f0"
        }
      ]
    },
    {
      "id": "langchain-ai-langchain",
      "path": "langchain-ai-langchain",
      "license": "MIT",
      "source": {
        "name": "langchain-ai/langchain",
        "version": "d048fbe170573b6e7056b5ef5f78d8451e54abaf",
        "url": "https://github.com/langchain-ai/langchain",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/langchain-ai/langchain/license?ref=d048fbe170573b6e7056b5ef5f78d8451e54abaf",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/langchain-ai/langchain.git",
          "revision": "d048fbe170573b6e7056b5ef5f78d8451e54abaf",
          "ref": "d048fbe170573b6e7056b5ef5f78d8451e54abaf"
        }
      ]
    },
    {
      "id": "microsoft-powertoys",
      "path": "microsoft-powertoys",
      "license": "MIT",
      "source": {
        "name": "microsoft/PowerToys",
        "version": "9e12b7a8eed2cb693d3e6b293cd601675e76a4b0",
        "url": "https://github.com/microsoft/PowerToys",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/microsoft/PowerToys/license?ref=9e12b7a8eed2cb693d3e6b293cd601675e76a4b0",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/microsoft/PowerToys.git",
          "revision": "9e12b7a8eed2cb693d3e6b293cd601675e76a4b0",
          "ref": "9e12b7a8eed2cb693d3e6b293cd601675e76a4b0"
        }
      ]
    },
    {
      "id": "golang-go",
      "path": "golang-go",
      "license": "BSD-3-Clause",
      "source": {
        "name": "golang/go",
        "version": "42a6439b1241906746e0a5d68ee6a6318813fa49",
        "url": "https://github.com/golang/go",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/golang/go/license?ref=42a6439b1241906746e0a5d68ee6a6318813fa49",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/golang/go.git",
          "revision": "42a6439b1241906746e0a5d68ee6a6318813fa49",
          "ref": "42a6439b1241906746e0a5d68ee6a6318813fa49"
        }
      ]
    },
    {
      "id": "excalidraw-excalidraw",
      "path": "excalidraw-excalidraw",
      "license": "MIT",
      "source": {
        "name": "excalidraw/excalidraw",
        "version": "cf212b2f3354c09bd6f960b53a9cfb0a3ecbfa58",
        "url": "https://github.com/excalidraw/excalidraw",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/excalidraw/excalidraw/license?ref=cf212b2f3354c09bd6f960b53a9cfb0a3ecbfa58",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/excalidraw/excalidraw.git",
          "revision": "cf212b2f3354c09bd6f960b53a9cfb0a3ecbfa58",
          "ref": "cf212b2f3354c09bd6f960b53a9cfb0a3ecbfa58"
        }
      ]
    },
    {
      "id": "react-react-native",
      "path": "react-react-native",
      "license": "MIT",
      "source": {
        "name": "react/react-native",
        "version": "4bf9d4e9b079a3b77842727c68b82f55415898ac",
        "url": "https://github.com/react/react-native",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/react/react-native/license?ref=4bf9d4e9b079a3b77842727c68b82f55415898ac",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/react/react-native.git",
          "revision": "4bf9d4e9b079a3b77842727c68b82f55415898ac",
          "ref": "4bf9d4e9b079a3b77842727c68b82f55415898ac"
        }
      ]
    },
    {
      "id": "kubernetes-kubernetes",
      "path": "kubernetes-kubernetes",
      "license": "Apache-2.0",
      "source": {
        "name": "kubernetes/kubernetes",
        "version": "94c136764292cc5fac976c0de6587daaea56410f",
        "url": "https://github.com/kubernetes/kubernetes",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/kubernetes/kubernetes/license?ref=94c136764292cc5fac976c0de6587daaea56410f",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/kubernetes/kubernetes.git",
          "revision": "94c136764292cc5fac976c0de6587daaea56410f",
          "ref": "94c136764292cc5fac976c0de6587daaea56410f"
        }
      ]
    },
    {
      "id": "ggml-org-llama.cpp",
      "path": "ggml-org-llama.cpp",
      "license": "MIT",
      "source": {
        "name": "ggml-org/llama.cpp",
        "version": "7ba604f1cb61cd14898138e9abc0b4ff2601f180",
        "url": "https://github.com/ggml-org/llama.cpp",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ggml-org/llama.cpp/license?ref=7ba604f1cb61cd14898138e9abc0b4ff2601f180",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ggml-org/llama.cpp.git",
          "revision": "7ba604f1cb61cd14898138e9abc0b4ff2601f180",
          "ref": "7ba604f1cb61cd14898138e9abc0b4ff2601f180"
        }
      ]
    },
    {
      "id": "electron-electron",
      "path": "electron-electron",
      "license": "MIT",
      "source": {
        "name": "electron/electron",
        "version": "50b779bde5478548df30229d81dd1a12e3434c85",
        "url": "https://github.com/electron/electron",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/electron/electron/license?ref=50b779bde5478548df30229d81dd1a12e3434c85",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/electron/electron.git",
          "revision": "50b779bde5478548df30229d81dd1a12e3434c85",
          "ref": "50b779bde5478548df30229d81dd1a12e3434c85"
        }
      ]
    },
    {
      "id": "shadcn-ui-ui",
      "path": "shadcn-ui-ui",
      "license": "MIT",
      "source": {
        "name": "shadcn-ui/ui",
        "version": "6261bd89f72d794aea491482cc2acfd8dc3d63e2",
        "url": "https://github.com/shadcn-ui/ui",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/shadcn-ui/ui/license?ref=6261bd89f72d794aea491482cc2acfd8dc3d63e2",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/shadcn-ui/ui.git",
          "revision": "6261bd89f72d794aea491482cc2acfd8dc3d63e2",
          "ref": "6261bd89f72d794aea491482cc2acfd8dc3d63e2"
        }
      ]
    },
    {
      "id": "rust-lang-rust",
      "path": "rust-lang-rust",
      "license": "Apache-2.0",
      "source": {
        "name": "rust-lang/rust",
        "version": "4667d75565e47ba5df36c0df598c556b543e8624",
        "url": "https://github.com/rust-lang/rust",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/rust-lang/rust/license?ref=4667d75565e47ba5df36c0df598c556b543e8624",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/rust-lang/rust.git",
          "revision": "4667d75565e47ba5df36c0df598c556b543e8624",
          "ref": "4667d75565e47ba5df36c0df598c556b543e8624"
        }
      ]
    },
    {
      "id": "godotengine-godot",
      "path": "godotengine-godot",
      "license": "MIT",
      "source": {
        "name": "godotengine/godot",
        "version": "4173760fdf6c2c722e82e08cb58e55f34c9efd80",
        "url": "https://github.com/godotengine/godot",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/godotengine/godot/license?ref=4173760fdf6c2c722e82e08cb58e55f34c9efd80",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/godotengine/godot.git",
          "revision": "4173760fdf6c2c722e82e08cb58e55f34c9efd80",
          "ref": "4173760fdf6c2c722e82e08cb58e55f34c9efd80"
        }
      ]
    },
    {
      "id": "mrdoob-three.js",
      "path": "mrdoob-three.js",
      "license": "MIT",
      "source": {
        "name": "mrdoob/three.js",
        "version": "98fbdb4a5ca8f095554e5ea58b8f58c8cbc35aac",
        "url": "https://github.com/mrdoob/three.js",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mrdoob/three.js/license?ref=98fbdb4a5ca8f095554e5ea58b8f58c8cbc35aac",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/mrdoob/three.js.git",
          "revision": "98fbdb4a5ca8f095554e5ea58b8f58c8cbc35aac",
          "ref": "98fbdb4a5ca8f095554e5ea58b8f58c8cbc35aac"
        }
      ]
    },
    {
      "id": "tauri-apps-tauri",
      "path": "tauri-apps-tauri",
      "license": "Apache-2.0",
      "source": {
        "name": "tauri-apps/tauri",
        "version": "34ec18ba5e1acabebd66ae79d6fc746f63d8eb96",
        "url": "https://github.com/tauri-apps/tauri",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/tauri-apps/tauri/license?ref=34ec18ba5e1acabebd66ae79d6fc746f63d8eb96",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/tauri-apps/tauri.git",
          "revision": "34ec18ba5e1acabebd66ae79d6fc746f63d8eb96",
          "ref": "34ec18ba5e1acabebd66ae79d6fc746f63d8eb96"
        }
      ]
    },
    {
      "id": "axios-axios",
      "path": "axios-axios",
      "license": "MIT",
      "source": {
        "name": "axios/axios",
        "version": "f5e83e49ee32b1004db82dad2b14d1e273a99e07",
        "url": "https://github.com/axios/axios",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/axios/axios/license?ref=f5e83e49ee32b1004db82dad2b14d1e273a99e07",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/axios/axios.git",
          "revision": "f5e83e49ee32b1004db82dad2b14d1e273a99e07",
          "ref": "f5e83e49ee32b1004db82dad2b14d1e273a99e07"
        }
      ]
    },
    {
      "id": "fatedier-frp",
      "path": "fatedier-frp",
      "license": "Apache-2.0",
      "source": {
        "name": "fatedier/frp",
        "version": "d1928f968938e4f1b3b72fd12d581342e57a5030",
        "url": "https://github.com/fatedier/frp",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/fatedier/frp/license?ref=d1928f968938e4f1b3b72fd12d581342e57a5030",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/fatedier/frp.git",
          "revision": "d1928f968938e4f1b3b72fd12d581342e57a5030",
          "ref": "d1928f968938e4f1b3b72fd12d581342e57a5030"
        }
      ]
    },
    {
      "id": "browser-use-browser-use",
      "path": "browser-use-browser-use",
      "license": "MIT",
      "source": {
        "name": "browser-use/browser-use",
        "version": "32601887cfbc9f4f1e3cad3e2b678e56aeaeaae4",
        "url": "https://github.com/browser-use/browser-use",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/browser-use/browser-use/license?ref=32601887cfbc9f4f1e3cad3e2b678e56aeaeaae4",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/browser-use/browser-use.git",
          "revision": "32601887cfbc9f4f1e3cad3e2b678e56aeaeaae4",
          "ref": "32601887cfbc9f4f1e3cad3e2b678e56aeaeaae4"
        }
      ]
    },
    {
      "id": "denoland-deno",
      "path": "denoland-deno",
      "license": "MIT",
      "source": {
        "name": "denoland/deno",
        "version": "98dc759254a90b98f7bbb62ba5361e531d0db6a5",
        "url": "https://github.com/denoland/deno",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/denoland/deno/license?ref=98dc759254a90b98f7bbb62ba5361e531d0db6a5",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/denoland/deno.git",
          "revision": "98dc759254a90b98f7bbb62ba5361e531d0db6a5",
          "ref": "98dc759254a90b98f7bbb62ba5361e531d0db6a5"
        }
      ]
    },
    {
      "id": "openai-whisper",
      "path": "openai-whisper",
      "license": "MIT",
      "source": {
        "name": "openai/whisper",
        "version": "5f86d1d86363843179951550570367b37c5d6f78",
        "url": "https://github.com/openai/whisper",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/openai/whisper/license?ref=5f86d1d86363843179951550570367b37c5d6f78",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/openai/whisper.git",
          "revision": "5f86d1d86363843179951550570367b37c5d6f78",
          "ref": "5f86d1d86363843179951550570367b37c5d6f78"
        }
      ]
    },
    {
      "id": "microsoft-terminal",
      "path": "microsoft-terminal",
      "license": "MIT",
      "source": {
        "name": "microsoft/terminal",
        "version": "b888cb7e4c3b0b21b7ed66c224bcdf7fa9ef6d9a",
        "url": "https://github.com/microsoft/terminal",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/microsoft/terminal/license?ref=b888cb7e4c3b0b21b7ed66c224bcdf7fa9ef6d9a",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/microsoft/terminal.git",
          "revision": "b888cb7e4c3b0b21b7ed66c224bcdf7fa9ef6d9a",
          "ref": "b888cb7e4c3b0b21b7ed66c224bcdf7fa9ef6d9a"
        }
      ]
    },
    {
      "id": "deepseek-ai-deepseek-v3",
      "path": "deepseek-ai-deepseek-v3",
      "license": "MIT",
      "source": {
        "name": "deepseek-ai/DeepSeek-V3",
        "version": "9b4e9788e4a3a731f7567338ed15d3ec549ce03b",
        "url": "https://github.com/deepseek-ai/DeepSeek-V3",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/deepseek-ai/DeepSeek-V3/license?ref=9b4e9788e4a3a731f7567338ed15d3ec549ce03b",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/deepseek-ai/DeepSeek-V3.git",
          "revision": "9b4e9788e4a3a731f7567338ed15d3ec549ce03b",
          "ref": "9b4e9788e4a3a731f7567338ed15d3ec549ce03b"
        }
      ]
    },
    {
      "id": "react-create-react-app",
      "path": "react-create-react-app",
      "license": "MIT",
      "source": {
        "name": "react/create-react-app",
        "version": "6254386531d263688ccfa542d0e628fbc0de0b28",
        "url": "https://github.com/react/create-react-app",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/react/create-react-app/license?ref=6254386531d263688ccfa542d0e628fbc0de0b28",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/react/create-react-app.git",
          "revision": "6254386531d263688ccfa542d0e628fbc0de0b28",
          "ref": "6254386531d263688ccfa542d0e628fbc0de0b28"
        }
      ]
    },
    {
      "id": "harry0703-moneyprinterturbo",
      "path": "harry0703-moneyprinterturbo",
      "license": "MIT",
      "source": {
        "name": "harry0703/MoneyPrinterTurbo",
        "version": "e14dea5578bb2154480b6bc436009eaa9987f0e3",
        "url": "https://github.com/harry0703/MoneyPrinterTurbo",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/harry0703/MoneyPrinterTurbo/license?ref=e14dea5578bb2154480b6bc436009eaa9987f0e3",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/harry0703/MoneyPrinterTurbo.git",
          "revision": "e14dea5578bb2154480b6bc436009eaa9987f0e3",
          "ref": "e14dea5578bb2154480b6bc436009eaa9987f0e3"
        }
      ]
    },
    {
      "id": "fastapi-fastapi",
      "path": "fastapi-fastapi",
      "license": "MIT",
      "source": {
        "name": "fastapi/fastapi",
        "version": "0c2b6aafd7a2e3a5bf1055ea0ed0a41da15ba5f4",
        "url": "https://github.com/fastapi/fastapi",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/fastapi/fastapi/license?ref=0c2b6aafd7a2e3a5bf1055ea0ed0a41da15ba5f4",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/fastapi/fastapi.git",
          "revision": "0c2b6aafd7a2e3a5bf1055ea0ed0a41da15ba5f4",
          "ref": "0c2b6aafd7a2e3a5bf1055ea0ed0a41da15ba5f4"
        }
      ]
    },
    {
      "id": "angular-angular",
      "path": "angular-angular",
      "license": "MIT",
      "source": {
        "name": "angular/angular",
        "version": "565dbb2fe5406f2a86d43a5b3c6993434b7124a7",
        "url": "https://github.com/angular/angular",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/angular/angular/license?ref=565dbb2fe5406f2a86d43a5b3c6993434b7124a7",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/angular/angular.git",
          "revision": "565dbb2fe5406f2a86d43a5b3c6993434b7124a7",
          "ref": "565dbb2fe5406f2a86d43a5b3c6993434b7124a7"
        }
      ]
    },
    {
      "id": "ant-design-ant-design",
      "path": "ant-design-ant-design",
      "license": "MIT",
      "source": {
        "name": "ant-design/ant-design",
        "version": "41ba18cfc3d8a0f37ab89e143fed27d341f320d0",
        "url": "https://github.com/ant-design/ant-design",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ant-design/ant-design/license?ref=41ba18cfc3d8a0f37ab89e143fed27d341f320d0",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ant-design/ant-design.git",
          "revision": "41ba18cfc3d8a0f37ab89e143fed27d341f320d0",
          "ref": "41ba18cfc3d8a0f37ab89e143fed27d341f320d0"
        }
      ]
    },
    {
      "id": "mui-material-ui",
      "path": "mui-material-ui",
      "license": "MIT",
      "source": {
        "name": "mui/material-ui",
        "version": "81e94061ca393d4eaf238e6f77c283b2edd9ef7e",
        "url": "https://github.com/mui/material-ui",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mui/material-ui/license?ref=81e94061ca393d4eaf238e6f77c283b2edd9ef7e",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/mui/material-ui.git",
          "revision": "81e94061ca393d4eaf238e6f77c283b2edd9ef7e",
          "ref": "81e94061ca393d4eaf238e6f77c283b2edd9ef7e"
        }
      ]
    },
    {
      "id": "nvbn-thefuck",
      "path": "nvbn-thefuck",
      "license": "MIT",
      "source": {
        "name": "nvbn/thefuck",
        "version": "c7e7e1d884d3bb241ea6448f72a989434c2a35ec",
        "url": "https://github.com/nvbn/thefuck",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/nvbn/thefuck/license?ref=c7e7e1d884d3bb241ea6448f72a989434c2a35ec",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/nvbn/thefuck.git",
          "revision": "c7e7e1d884d3bb241ea6448f72a989434c2a35ec",
          "ref": "c7e7e1d884d3bb241ea6448f72a989434c2a35ec"
        }
      ]
    },
    {
      "id": "tailwindlabs-tailwindcss",
      "path": "tailwindlabs-tailwindcss",
      "license": "MIT",
      "source": {
        "name": "tailwindlabs/tailwindcss",
        "version": "46df7ee2fc4ae822d414d35bbd48be024e5cb1c0",
        "url": "https://github.com/tailwindlabs/tailwindcss",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/tailwindlabs/tailwindcss/license?ref=46df7ee2fc4ae822d414d35bbd48be024e5cb1c0",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/tailwindlabs/tailwindcss.git",
          "revision": "46df7ee2fc4ae822d414d35bbd48be024e5cb1c0",
          "ref": "46df7ee2fc4ae822d414d35bbd48be024e5cb1c0"
        }
      ]
    },
    {
      "id": "tauricresearch-tradingagents",
      "path": "tauricresearch-tradingagents",
      "license": "Apache-2.0",
      "source": {
        "name": "TauricResearch/TradingAgents",
        "version": "a33fd4c0f134485a43553a2c23a63cb14adbd88f",
        "url": "https://github.com/TauricResearch/TradingAgents",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/TauricResearch/TradingAgents/license?ref=a33fd4c0f134485a43553a2c23a63cb14adbd88f",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/TauricResearch/TradingAgents.git",
          "revision": "a33fd4c0f134485a43553a2c23a63cb14adbd88f",
          "ref": "a33fd4c0f134485a43553a2c23a63cb14adbd88f"
        }
      ]
    },
    {
      "id": "puppeteer-puppeteer",
      "path": "puppeteer-puppeteer",
      "license": "Apache-2.0",
      "source": {
        "name": "puppeteer/puppeteer",
        "version": "566e6a9cffb9678e20e9ec9a4cc1be343a7ac94f",
        "url": "https://github.com/puppeteer/puppeteer",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/puppeteer/puppeteer/license?ref=566e6a9cffb9678e20e9ec9a4cc1be343a7ac94f",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/puppeteer/puppeteer.git",
          "revision": "566e6a9cffb9678e20e9ec9a4cc1be343a7ac94f",
          "ref": "566e6a9cffb9678e20e9ec9a4cc1be343a7ac94f"
        }
      ]
    },
    {
      "id": "nvm-sh-nvm",
      "path": "nvm-sh-nvm",
      "license": "MIT",
      "source": {
        "name": "nvm-sh/nvm",
        "version": "65ded65d46c16481dbbe8e93f8ba9e6b35f20740",
        "url": "https://github.com/nvm-sh/nvm",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/nvm-sh/nvm/license?ref=65ded65d46c16481dbbe8e93f8ba9e6b35f20740",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Shell"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/nvm-sh/nvm.git",
          "revision": "65ded65d46c16481dbbe8e93f8ba9e6b35f20740",
          "ref": "65ded65d46c16481dbbe8e93f8ba9e6b35f20740"
        }
      ]
    },
    {
      "id": "microsoft-playwright",
      "path": "microsoft-playwright",
      "license": "Apache-2.0",
      "source": {
        "name": "microsoft/playwright",
        "version": "c973356ee9e3906260f60da5e3e04442e069a0d4",
        "url": "https://github.com/microsoft/playwright",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/microsoft/playwright/license?ref=c973356ee9e3906260f60da5e3e04442e069a0d4",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/microsoft/playwright.git",
          "revision": "c973356ee9e3906260f60da5e3e04442e069a0d4",
          "ref": "c973356ee9e3906260f60da5e3e04442e069a0d4"
        }
      ]
    },
    {
      "id": "opencv-opencv",
      "path": "opencv-opencv",
      "license": "Apache-2.0",
      "source": {
        "name": "opencv/opencv",
        "version": "77dfa297d08fdecdc509fc01ad92a2e9ec776a57",
        "url": "https://github.com/opencv/opencv",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/opencv/opencv/license?ref=77dfa297d08fdecdc509fc01ad92a2e9ec776a57",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/opencv/opencv.git",
          "revision": "77dfa297d08fdecdc509fc01ad92a2e9ec776a57",
          "ref": "77dfa297d08fdecdc509fc01ad92a2e9ec776a57"
        }
      ]
    },
    {
      "id": "panjiachen-vue-element-admin",
      "path": "panjiachen-vue-element-admin",
      "license": "MIT",
      "source": {
        "name": "PanJiaChen/vue-element-admin",
        "version": "6858a9ad67483025f6a9432a926beb9327037be3",
        "url": "https://github.com/PanJiaChen/vue-element-admin",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/PanJiaChen/vue-element-admin/license?ref=6858a9ad67483025f6a9432a926beb9327037be3",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Vue"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/PanJiaChen/vue-element-admin.git",
          "revision": "6858a9ad67483025f6a9432a926beb9327037be3",
          "ref": "6858a9ad67483025f6a9432a926beb9327037be3"
        }
      ]
    },
    {
      "id": "louislam-uptime-kuma",
      "path": "louislam-uptime-kuma",
      "license": "MIT",
      "source": {
        "name": "louislam/uptime-kuma",
        "version": "77d1a0c57a37a4cf5657bb7b514b4e08d455928e",
        "url": "https://github.com/louislam/uptime-kuma",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/louislam/uptime-kuma/license?ref=77d1a0c57a37a4cf5657bb7b514b4e08d455928e",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/louislam/uptime-kuma.git",
          "revision": "77d1a0c57a37a4cf5657bb7b514b4e08d455928e",
          "ref": "77d1a0c57a37a4cf5657bb7b514b4e08d455928e"
        }
      ]
    },
    {
      "id": "bitcoin-bitcoin",
      "path": "bitcoin-bitcoin",
      "license": "MIT",
      "source": {
        "name": "bitcoin/bitcoin",
        "version": "128456b62d5e38abea031f97f823d5b28aef9357",
        "url": "https://github.com/bitcoin/bitcoin",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bitcoin/bitcoin/license?ref=128456b62d5e38abea031f97f823d5b28aef9357",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/bitcoin/bitcoin.git",
          "revision": "128456b62d5e38abea031f97f823d5b28aef9357",
          "ref": "128456b62d5e38abea031f97f823d5b28aef9357"
        }
      ]
    },
    {
      "id": "home-assistant-core",
      "path": "home-assistant-core",
      "license": "Apache-2.0",
      "source": {
        "name": "home-assistant/core",
        "version": "c369f973abfcfba865a745a1750c0fe887e98d60",
        "url": "https://github.com/home-assistant/core",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/home-assistant/core/license?ref=c369f973abfcfba865a745a1750c0fe887e98d60",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/home-assistant/core.git",
          "revision": "c369f973abfcfba865a745a1750c0fe887e98d60",
          "ref": "c369f973abfcfba865a745a1750c0fe887e98d60"
        }
      ]
    },
    {
      "id": "mermaid-js-mermaid",
      "path": "mermaid-js-mermaid",
      "license": "MIT",
      "source": {
        "name": "mermaid-js/mermaid",
        "version": "3d521b1ee5fc9079fe0659e776a1b2cdc37174b1",
        "url": "https://github.com/mermaid-js/mermaid",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mermaid-js/mermaid/license?ref=3d521b1ee5fc9079fe0659e776a1b2cdc37174b1",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/mermaid-js/mermaid.git",
          "revision": "3d521b1ee5fc9079fe0659e776a1b2cdc37174b1",
          "ref": "3d521b1ee5fc9079fe0659e776a1b2cdc37174b1"
        }
      ]
    },
    {
      "id": "gohugoio-hugo",
      "path": "gohugoio-hugo",
      "license": "Apache-2.0",
      "source": {
        "name": "gohugoio/hugo",
        "version": "44da086082a1dff487f4e5639bb03a65d9dd1ade",
        "url": "https://github.com/gohugoio/hugo",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/gohugoio/hugo/license?ref=44da086082a1dff487f4e5639bb03a65d9dd1ade",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/gohugoio/hugo.git",
          "revision": "44da086082a1dff487f4e5639bb03a65d9dd1ade",
          "ref": "44da086082a1dff487f4e5639bb03a65d9dd1ade"
        }
      ]
    },
    {
      "id": "3b1b-manim",
      "path": "3b1b-manim",
      "license": "MIT",
      "source": {
        "name": "3b1b/manim",
        "version": "01030ac5d23bc294ccb93cbfcda260f2d20dda62",
        "url": "https://github.com/3b1b/manim",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/3b1b/manim/license?ref=01030ac5d23bc294ccb93cbfcda260f2d20dda62",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/3b1b/manim.git",
          "revision": "01030ac5d23bc294ccb93cbfcda260f2d20dda62",
          "ref": "01030ac5d23bc294ccb93cbfcda260f2d20dda62"
        }
      ]
    },
    {
      "id": "gin-gonic-gin",
      "path": "gin-gonic-gin",
      "license": "MIT",
      "source": {
        "name": "gin-gonic/gin",
        "version": "34dac209ffb6ef85cc78c5d217bbb7ad001d68fd",
        "url": "https://github.com/gin-gonic/gin",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/gin-gonic/gin/license?ref=34dac209ffb6ef85cc78c5d217bbb7ad001d68fd",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/gin-gonic/gin.git",
          "revision": "34dac209ffb6ef85cc78c5d217bbb7ad001d68fd",
          "ref": "34dac209ffb6ef85cc78c5d217bbb7ad001d68fd"
        }
      ]
    },
    {
      "id": "chatgptnextweb-nextchat",
      "path": "chatgptnextweb-nextchat",
      "license": "MIT",
      "source": {
        "name": "ChatGPTNextWeb/NextChat",
        "version": "706a18b95b714ab29b2a4842d3b9ff4f887935d5",
        "url": "https://github.com/ChatGPTNextWeb/NextChat",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ChatGPTNextWeb/NextChat/license?ref=706a18b95b714ab29b2a4842d3b9ff4f887935d5",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ChatGPTNextWeb/NextChat.git",
          "revision": "706a18b95b714ab29b2a4842d3b9ff4f887935d5",
          "ref": "706a18b95b714ab29b2a4842d3b9ff4f887935d5"
        }
      ]
    },
    {
      "id": "sherlock-project-sherlock",
      "path": "sherlock-project-sherlock",
      "license": "MIT",
      "source": {
        "name": "sherlock-project/sherlock",
        "version": "9100f9d40a3274bd46f4ce903c5c6fee6f3745bc",
        "url": "https://github.com/sherlock-project/sherlock",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/sherlock-project/sherlock/license?ref=9100f9d40a3274bd46f4ce903c5c6fee6f3745bc",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/sherlock-project/sherlock.git",
          "revision": "9100f9d40a3274bd46f4ce903c5c6fee6f3745bc",
          "ref": "9100f9d40a3274bd46f4ce903c5c6fee6f3745bc"
        }
      ]
    },
    {
      "id": "vllm-project-vllm",
      "path": "vllm-project-vllm",
      "license": "Apache-2.0",
      "source": {
        "name": "vllm-project/vllm",
        "version": "cb1a52aee3b31c692a6629ebd7ff5503b3cd13f7",
        "url": "https://github.com/vllm-project/vllm",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/vllm-project/vllm/license?ref=cb1a52aee3b31c692a6629ebd7ff5503b3cd13f7",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/vllm-project/vllm.git",
          "revision": "cb1a52aee3b31c692a6629ebd7ff5503b3cd13f7",
          "ref": "cb1a52aee3b31c692a6629ebd7ff5503b3cd13f7"
        }
      ]
    },
    {
      "id": "astral-sh-uv",
      "path": "astral-sh-uv",
      "license": "Apache-2.0",
      "source": {
        "name": "astral-sh/uv",
        "version": "dd0584d560a4693b5713a78be54304123ada3e77",
        "url": "https://github.com/astral-sh/uv",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/astral-sh/uv/license?ref=dd0584d560a4693b5713a78be54304123ada3e77",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/astral-sh/uv.git",
          "revision": "dd0584d560a4693b5713a78be54304123ada3e77",
          "ref": "dd0584d560a4693b5713a78be54304123ada3e77"
        }
      ]
    },
    {
      "id": "django-django",
      "path": "django-django",
      "license": "BSD-3-Clause",
      "source": {
        "name": "django/django",
        "version": "c9eb16a87e60c305fb3651459639f647cce498db",
        "url": "https://github.com/django/django",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/django/django/license?ref=c9eb16a87e60c305fb3651459639f647cce498db",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/django/django.git",
          "revision": "c9eb16a87e60c305fb3651459639f647cce498db",
          "ref": "c9eb16a87e60c305fb3651459639f647cce498db"
        }
      ]
    },
    {
      "id": "sveltejs-svelte",
      "path": "sveltejs-svelte",
      "license": "MIT",
      "source": {
        "name": "sveltejs/svelte",
        "version": "26786e92985842a6d563c67049a43bc5857bf792",
        "url": "https://github.com/sveltejs/svelte",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/sveltejs/svelte/license?ref=26786e92985842a6d563c67049a43bc5857bf792",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/sveltejs/svelte.git",
          "revision": "26786e92985842a6d563c67049a43bc5857bf792",
          "ref": "26786e92985842a6d563c67049a43bc5857bf792"
        }
      ]
    },
    {
      "id": "paddlepaddle-paddleocr",
      "path": "paddlepaddle-paddleocr",
      "license": "Apache-2.0",
      "source": {
        "name": "PaddlePaddle/PaddleOCR",
        "version": "2661c7c0ef5c613e8f93c6e93b2e052399f0f854",
        "url": "https://github.com/PaddlePaddle/PaddleOCR",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/PaddlePaddle/PaddleOCR/license?ref=2661c7c0ef5c613e8f93c6e93b2e052399f0f854",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/PaddlePaddle/PaddleOCR.git",
          "revision": "2661c7c0ef5c613e8f93c6e93b2e052399f0f854",
          "ref": "2661c7c0ef5c613e8f93c6e93b2e052399f0f854"
        }
      ]
    },
    {
      "id": "localsend-localsend",
      "path": "localsend-localsend",
      "license": "Apache-2.0",
      "source": {
        "name": "localsend/localsend",
        "version": "ff2995c9523c5fae407f7d444d0986b2c6ae568e",
        "url": "https://github.com/localsend/localsend",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/localsend/localsend/license?ref=ff2995c9523c5fae407f7d444d0986b2c6ae568e",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Dart"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/localsend/localsend.git",
          "revision": "ff2995c9523c5fae407f7d444d0986b2c6ae568e",
          "ref": "ff2995c9523c5fae407f7d444d0986b2c6ae568e"
        }
      ]
    },
    {
      "id": "infiniflow-ragflow",
      "path": "infiniflow-ragflow",
      "license": "Apache-2.0",
      "source": {
        "name": "infiniflow/ragflow",
        "version": "99110c2df0d4822bd819eda36e4d038c33391123",
        "url": "https://github.com/infiniflow/ragflow",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/infiniflow/ragflow/license?ref=99110c2df0d4822bd819eda36e4d038c33391123",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/infiniflow/ragflow.git",
          "revision": "99110c2df0d4822bd819eda36e4d038c33391123",
          "ref": "99110c2df0d4822bd819eda36e4d038c33391123"
        }
      ]
    },
    {
      "id": "macrozheng-mall",
      "path": "macrozheng-mall",
      "license": "Apache-2.0",
      "source": {
        "name": "macrozheng/mall",
        "version": "0504e86b1f1b6f1b8aa6a734d37a90fb67346be7",
        "url": "https://github.com/macrozheng/mall",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/macrozheng/mall/license?ref=0504e86b1f1b6f1b8aa6a734d37a90fb67346be7",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/macrozheng/mall.git",
          "revision": "0504e86b1f1b6f1b8aa6a734d37a90fb67346be7",
          "ref": "0504e86b1f1b6f1b8aa6a734d37a90fb67346be7"
        }
      ]
    },
    {
      "id": "openhands-openhands",
      "path": "openhands-openhands",
      "license": "MIT",
      "source": {
        "name": "OpenHands/OpenHands",
        "version": "4470813ce58f5ac384e3d367d34518e10106526b",
        "url": "https://github.com/OpenHands/OpenHands",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/OpenHands/OpenHands/license?ref=4470813ce58f5ac384e3d367d34518e10106526b",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/OpenHands/OpenHands.git",
          "revision": "4470813ce58f5ac384e3d367d34518e10106526b",
          "ref": "4470813ce58f5ac384e3d367d34518e10106526b"
        }
      ]
    },
    {
      "id": "junegunn-fzf",
      "path": "junegunn-fzf",
      "license": "MIT",
      "source": {
        "name": "junegunn/fzf",
        "version": "715d26fa3949c9a0f1e41fcbda5440f3ac338e51",
        "url": "https://github.com/junegunn/fzf",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/junegunn/fzf/license?ref=715d26fa3949c9a0f1e41fcbda5440f3ac338e51",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/junegunn/fzf.git",
          "revision": "715d26fa3949c9a0f1e41fcbda5440f3ac338e51",
          "ref": "715d26fa3949c9a0f1e41fcbda5440f3ac338e51"
        }
      ]
    },
    {
      "id": "vitejs-vite",
      "path": "vitejs-vite",
      "license": "MIT",
      "source": {
        "name": "vitejs/vite",
        "version": "57fea001d154e7dd8d5d74d3082731f1dcfd31be",
        "url": "https://github.com/vitejs/vite",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/vitejs/vite/license?ref=57fea001d154e7dd8d5d74d3082731f1dcfd31be",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/vitejs/vite.git",
          "revision": "57fea001d154e7dd8d5d74d3082731f1dcfd31be",
          "ref": "57fea001d154e7dd8d5d74d3082731f1dcfd31be"
        }
      ]
    },
    {
      "id": "spring-projects-spring-boot",
      "path": "spring-projects-spring-boot",
      "license": "Apache-2.0",
      "source": {
        "name": "spring-projects/spring-boot",
        "version": "ee3c48d00ffa6efda14e730c02ba145dc15e0fe4",
        "url": "https://github.com/spring-projects/spring-boot",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/spring-projects/spring-boot/license?ref=ee3c48d00ffa6efda14e730c02ba145dc15e0fe4",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/spring-projects/spring-boot.git",
          "revision": "ee3c48d00ffa6efda14e730c02ba145dc15e0fe4",
          "ref": "ee3c48d00ffa6efda14e730c02ba145dc15e0fe4"
        }
      ]
    },
    {
      "id": "jesseduffield-lazygit",
      "path": "jesseduffield-lazygit",
      "license": "MIT",
      "source": {
        "name": "jesseduffield/lazygit",
        "version": "ddceff696286811d2adc02e27bad1b275b9b1c75",
        "url": "https://github.com/jesseduffield/lazygit",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jesseduffield/lazygit/license?ref=ddceff696286811d2adc02e27bad1b275b9b1c75",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/jesseduffield/lazygit.git",
          "revision": "ddceff696286811d2adc02e27bad1b275b9b1c75",
          "ref": "ddceff696286811d2adc02e27bad1b275b9b1c75"
        }
      ]
    },
    {
      "id": "hoppscotch-hoppscotch",
      "path": "hoppscotch-hoppscotch",
      "license": "MIT",
      "source": {
        "name": "hoppscotch/hoppscotch",
        "version": "1acb8a3a7581e4db32ba0d529170c4669a2e1053",
        "url": "https://github.com/hoppscotch/hoppscotch",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/hoppscotch/hoppscotch/license?ref=1acb8a3a7581e4db32ba0d529170c4669a2e1053",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/hoppscotch/hoppscotch.git",
          "revision": "1acb8a3a7581e4db32ba0d529170c4669a2e1053",
          "ref": "1acb8a3a7581e4db32ba0d529170c4669a2e1053"
        }
      ]
    },
    {
      "id": "anuraghazra-github-readme-stats",
      "path": "anuraghazra-github-readme-stats",
      "license": "MIT",
      "source": {
        "name": "anuraghazra/github-readme-stats",
        "version": "54a7985aeefda00d5eadb55b80c17c7f976c37d2",
        "url": "https://github.com/anuraghazra/github-readme-stats",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/anuraghazra/github-readme-stats/license?ref=54a7985aeefda00d5eadb55b80c17c7f976c37d2",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/anuraghazra/github-readme-stats.git",
          "revision": "54a7985aeefda00d5eadb55b80c17c7f976c37d2",
          "ref": "54a7985aeefda00d5eadb55b80c17c7f976c37d2"
        }
      ]
    },
    {
      "id": "d2l-ai-d2l-zh",
      "path": "d2l-ai-d2l-zh",
      "license": "Apache-2.0",
      "source": {
        "name": "d2l-ai/d2l-zh",
        "version": "e6b18ccea71451a55fcd861d7b96fddf2587b09a",
        "url": "https://github.com/d2l-ai/d2l-zh",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/d2l-ai/d2l-zh/license?ref=e6b18ccea71451a55fcd861d7b96fddf2587b09a",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/d2l-ai/d2l-zh.git",
          "revision": "e6b18ccea71451a55fcd861d7b96fddf2587b09a",
          "ref": "e6b18ccea71451a55fcd861d7b96fddf2587b09a"
        }
      ]
    },
    {
      "id": "z4nzu-hackingtool",
      "path": "z4nzu-hackingtool",
      "license": "MIT",
      "source": {
        "name": "Z4nzu/hackingtool",
        "version": "9b92b6156ddc5ff87bf0fa592d81c333a88d1c78",
        "url": "https://github.com/Z4nzu/hackingtool",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Z4nzu/hackingtool/license?ref=9b92b6156ddc5ff87bf0fa592d81c333a88d1c78",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Z4nzu/hackingtool.git",
          "revision": "9b92b6156ddc5ff87bf0fa592d81c333a88d1c78",
          "ref": "9b92b6156ddc5ff87bf0fa592d81c333a88d1c78"
        }
      ]
    },
    {
      "id": "coder-code-server",
      "path": "coder-code-server",
      "license": "MIT",
      "source": {
        "name": "coder/code-server",
        "version": "313bf0359b4d391ba18f1fa131aad8a583bc2919",
        "url": "https://github.com/coder/code-server",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/coder/code-server/license?ref=313bf0359b4d391ba18f1fa131aad8a583bc2919",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/coder/code-server.git",
          "revision": "313bf0359b4d391ba18f1fa131aad8a583bc2919",
          "ref": "313bf0359b4d391ba18f1fa131aad8a583bc2919"
        }
      ]
    },
    {
      "id": "nomic-ai-gpt4all",
      "path": "nomic-ai-gpt4all",
      "license": "MIT",
      "source": {
        "name": "nomic-ai/gpt4all",
        "version": "b666d16db5aeab8b91aaf7963adcee9c643734d7",
        "url": "https://github.com/nomic-ai/gpt4all",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/nomic-ai/gpt4all/license?ref=b666d16db5aeab8b91aaf7963adcee9c643734d7",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/nomic-ai/gpt4all.git",
          "revision": "b666d16db5aeab8b91aaf7963adcee9c643734d7",
          "ref": "b666d16db5aeab8b91aaf7963adcee9c643734d7"
        }
      ]
    },
    {
      "id": "unclecode-crawl4ai",
      "path": "unclecode-crawl4ai",
      "license": "Apache-2.0",
      "source": {
        "name": "unclecode/crawl4ai",
        "version": "7e801521428ee12509994d39151006f64055ebe3",
        "url": "https://github.com/unclecode/crawl4ai",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/unclecode/crawl4ai/license?ref=7e801521428ee12509994d39151006f64055ebe3",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/unclecode/crawl4ai.git",
          "revision": "7e801521428ee12509994d39151006f64055ebe3",
          "ref": "7e801521428ee12509994d39151006f64055ebe3"
        }
      ]
    },
    {
      "id": "nestjs-nest",
      "path": "nestjs-nest",
      "license": "MIT",
      "source": {
        "name": "nestjs/nest",
        "version": "c3bc75c973813969aa676793e20a7cba12a9daf5",
        "url": "https://github.com/nestjs/nest",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/nestjs/nest/license?ref=c3bc75c973813969aa676793e20a7cba12a9daf5",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/nestjs/nest.git",
          "revision": "c3bc75c973813969aa676793e20a7cba12a9daf5",
          "ref": "c3bc75c973813969aa676793e20a7cba12a9daf5"
        }
      ]
    },
    {
      "id": "tesseract-ocr-tesseract",
      "path": "tesseract-ocr-tesseract",
      "license": "Apache-2.0",
      "source": {
        "name": "tesseract-ocr/tesseract",
        "version": "64ed93b68c01f359d924fc1bfcf0d5931eb77211",
        "url": "https://github.com/tesseract-ocr/tesseract",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/tesseract-ocr/tesseract/license?ref=64ed93b68c01f359d924fc1bfcf0d5931eb77211",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/tesseract-ocr/tesseract.git",
          "revision": "64ed93b68c01f359d924fc1bfcf0d5931eb77211",
          "ref": "64ed93b68c01f359d924fc1bfcf0d5931eb77211"
        }
      ]
    },
    {
      "id": "typicode-json-server",
      "path": "typicode-json-server",
      "license": "MIT",
      "source": {
        "name": "typicode/json-server",
        "version": "89a34a44b7a6a5311dc84f3b8a1b8b45c0905aea",
        "url": "https://github.com/typicode/json-server",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/typicode/json-server/license?ref=89a34a44b7a6a5311dc84f3b8a1b8b45c0905aea",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/typicode/json-server.git",
          "revision": "89a34a44b7a6a5311dc84f3b8a1b8b45c0905aea",
          "ref": "89a34a44b7a6a5311dc84f3b8a1b8b45c0905aea"
        }
      ]
    },
    {
      "id": "ocornut-imgui",
      "path": "ocornut-imgui",
      "license": "MIT",
      "source": {
        "name": "ocornut/imgui",
        "version": "46d39d56febc2a00bdd2270dc88c8a13f2a0441a",
        "url": "https://github.com/ocornut/imgui",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ocornut/imgui/license?ref=46d39d56febc2a00bdd2270dc88c8a13f2a0441a",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ocornut/imgui.git",
          "revision": "46d39d56febc2a00bdd2270dc88c8a13f2a0441a",
          "ref": "46d39d56febc2a00bdd2270dc88c8a13f2a0441a"
        }
      ]
    },
    {
      "id": "caddyserver-caddy",
      "path": "caddyserver-caddy",
      "license": "Apache-2.0",
      "source": {
        "name": "caddyserver/caddy",
        "version": "64b64c61ebc40ea37280b2baa1a7a492cc1156c5",
        "url": "https://github.com/caddyserver/caddy",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/caddyserver/caddy/license?ref=64b64c61ebc40ea37280b2baa1a7a492cc1156c5",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/caddyserver/caddy.git",
          "revision": "64b64c61ebc40ea37280b2baa1a7a492cc1156c5",
          "ref": "64b64c61ebc40ea37280b2baa1a7a492cc1156c5"
        }
      ]
    },
    {
      "id": "apache-superset",
      "path": "apache-superset",
      "license": "Apache-2.0",
      "source": {
        "name": "apache/superset",
        "version": "3b164e4270860ac07223d4df1a60ca7b56312362",
        "url": "https://github.com/apache/superset",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/apache/superset/license?ref=3b164e4270860ac07223d4df1a60ca7b56312362",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/apache/superset.git",
          "revision": "3b164e4270860ac07223d4df1a60ca7b56312362",
          "ref": "3b164e4270860ac07223d4df1a60ca7b56312362"
        }
      ]
    },
    {
      "id": "hiyouga-llamafactory",
      "path": "hiyouga-llamafactory",
      "license": "Apache-2.0",
      "source": {
        "name": "hiyouga/LlamaFactory",
        "version": "887b850813d80a8d893ec56703d5b3a0eec46de6",
        "url": "https://github.com/hiyouga/LlamaFactory",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/hiyouga/LlamaFactory/license?ref=887b850813d80a8d893ec56703d5b3a0eec46de6",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/hiyouga/LlamaFactory.git",
          "revision": "887b850813d80a8d893ec56703d5b3a0eec46de6",
          "ref": "887b850813d80a8d893ec56703d5b3a0eec46de6"
        }
      ]
    },
    {
      "id": "abi-screenshot-to-code",
      "path": "abi-screenshot-to-code",
      "license": "MIT",
      "source": {
        "name": "abi/screenshot-to-code",
        "version": "d026163f586dfa8c5c10d28c36edd59a9d3b0e88",
        "url": "https://github.com/abi/screenshot-to-code",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/abi/screenshot-to-code/license?ref=d026163f586dfa8c5c10d28c36edd59a9d3b0e88",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/abi/screenshot-to-code.git",
          "revision": "d026163f586dfa8c5c10d28c36edd59a9d3b0e88",
          "ref": "d026163f586dfa8c5c10d28c36edd59a9d3b0e88"
        }
      ]
    },
    {
      "id": "unionlabs-union",
      "path": "unionlabs-union",
      "license": "Apache-2.0",
      "source": {
        "name": "unionlabs/union",
        "version": "031785bb6dc6b957c624e62bc64c184409c97d7b",
        "url": "https://github.com/unionlabs/union",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/unionlabs/union/license?ref=031785bb6dc6b957c624e62bc64c184409c97d7b",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/unionlabs/union.git",
          "revision": "031785bb6dc6b957c624e62bc64c184409c97d7b",
          "ref": "031785bb6dc6b957c624e62bc64c184409c97d7b"
        }
      ]
    },
    {
      "id": "eugeny-tabby",
      "path": "eugeny-tabby",
      "license": "MIT",
      "source": {
        "name": "Eugeny/tabby",
        "version": "14e2d60b9b6dee84a53c37f05eefeb803787de04",
        "url": "https://github.com/Eugeny/tabby",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Eugeny/tabby/license?ref=14e2d60b9b6dee84a53c37f05eefeb803787de04",
          "declaration": "MIT"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Eugeny/tabby.git",
          "revision": "14e2d60b9b6dee84a53c37f05eefeb803787de04",
          "ref": "14e2d60b9b6dee84a53c37f05eefeb803787de04"
        }
      ]
    },
    {
      "id": "d4vinci-scrapling",
      "path": "d4vinci-scrapling",
      "license": "BSD-3-Clause",
      "source": {
        "name": "D4Vinci/Scrapling",
        "version": "39847bd2da41f8e089593f91016d81d3a4771e6f",
        "url": "https://github.com/D4Vinci/Scrapling",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/D4Vinci/Scrapling/license?ref=39847bd2da41f8e089593f91016d81d3a4771e6f",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/D4Vinci/Scrapling.git",
          "revision": "39847bd2da41f8e089593f91016d81d3a4771e6f",
          "ref": "39847bd2da41f8e089593f91016d81d3a4771e6f"
        }
      ]
    },
    {
      "id": "pallets-flask",
      "path": "pallets-flask",
      "license": "BSD-3-Clause",
      "source": {
        "name": "pallets/flask",
        "version": "6a2f545bfd8ed31e19066a299296917e034aca58",
        "url": "https://github.com/pallets/flask",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/pallets/flask/license?ref=6a2f545bfd8ed31e19066a299296917e034aca58",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/pallets/flask.git",
          "revision": "6a2f545bfd8ed31e19066a299296917e034aca58",
          "ref": "6a2f545bfd8ed31e19066a299296917e034aca58"
        }
      ]
    },
    {
      "id": "nationalsecurityagency-ghidra",
      "path": "nationalsecurityagency-ghidra",
      "license": "Apache-2.0",
      "source": {
        "name": "NationalSecurityAgency/ghidra",
        "version": "291d5c4e77735b0b4b40613d952ecdd157ef750b",
        "url": "https://github.com/NationalSecurityAgency/ghidra",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/NationalSecurityAgency/ghidra/license?ref=291d5c4e77735b0b4b40613d952ecdd157ef750b",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/NationalSecurityAgency/ghidra.git",
          "revision": "291d5c4e77735b0b4b40613d952ecdd157ef750b",
          "ref": "291d5c4e77735b0b4b40613d952ecdd157ef750b"
        }
      ]
    },
    {
      "id": "moby-moby",
      "path": "moby-moby",
      "license": "Apache-2.0",
      "source": {
        "name": "moby/moby",
        "version": "e456107947c1d554ae1ad0645ed6e13978aa1c2d",
        "url": "https://github.com/moby/moby",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/moby/moby/license?ref=e456107947c1d554ae1ad0645ed6e13978aa1c2d",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/moby/moby.git",
          "revision": "e456107947c1d554ae1ad0645ed6e13978aa1c2d",
          "ref": "e456107947c1d554ae1ad0645ed6e13978aa1c2d"
        }
      ]
    },
    {
      "id": "swiftlang-swift",
      "path": "swiftlang-swift",
      "license": "Apache-2.0",
      "source": {
        "name": "swiftlang/swift",
        "version": "e2bbdd321e85cf8a54c253c1d7cfbf495103e6f7",
        "url": "https://github.com/swiftlang/swift",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/swiftlang/swift/license?ref=e2bbdd321e85cf8a54c253c1d7cfbf495103e6f7",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Swift"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/swiftlang/swift.git",
          "revision": "e2bbdd321e85cf8a54c253c1d7cfbf495103e6f7",
          "ref": "e2bbdd321e85cf8a54c253c1d7cfbf495103e6f7"
        }
      ]
    },
    {
      "id": "unslothai-unsloth",
      "path": "unslothai-unsloth",
      "license": "Apache-2.0",
      "source": {
        "name": "unslothai/unsloth",
        "version": "2a56df02e6a00ea2496169fe0ef6dc2d9ea9c3a5",
        "url": "https://github.com/unslothai/unsloth",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/unslothai/unsloth/license?ref=2a56df02e6a00ea2496169fe0ef6dc2d9ea9c3a5",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/unslothai/unsloth.git",
          "revision": "2a56df02e6a00ea2496169fe0ef6dc2d9ea9c3a5",
          "ref": "2a56df02e6a00ea2496169fe0ef6dc2d9ea9c3a5"
        }
      ]
    },
    {
      "id": "openinterpreter-openinterpreter",
      "path": "openinterpreter-openinterpreter",
      "license": "Apache-2.0",
      "source": {
        "name": "openinterpreter/openinterpreter",
        "version": "984acc698cd038885ecb0b82721402b01e11a5ad",
        "url": "https://github.com/openinterpreter/openinterpreter",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/openinterpreter/openinterpreter/license?ref=984acc698cd038885ecb0b82721402b01e11a5ad",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/openinterpreter/openinterpreter.git",
          "revision": "984acc698cd038885ecb0b82721402b01e11a5ad",
          "ref": "984acc698cd038885ecb0b82721402b01e11a5ad"
        }
      ]
    },
    {
      "id": "apache-echarts",
      "path": "apache-echarts",
      "license": "Apache-2.0",
      "source": {
        "name": "apache/echarts",
        "version": "30076aedcd7b7f65d8dd8e8d9ece46ce778133a3",
        "url": "https://github.com/apache/echarts",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/apache/echarts/license?ref=30076aedcd7b7f65d8dd8e8d9ece46ce778133a3",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/apache/echarts.git",
          "revision": "30076aedcd7b7f65d8dd8e8d9ece46ce778133a3",
          "ref": "30076aedcd7b7f65d8dd8e8d9ece46ce778133a3"
        }
      ]
    },
    {
      "id": "cline-cline",
      "path": "cline-cline",
      "license": "Apache-2.0",
      "source": {
        "name": "cline/cline",
        "version": "45403900964a74aa5ae3683a0e61b535600b97e0",
        "url": "https://github.com/cline/cline",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/cline/cline/license?ref=45403900964a74aa5ae3683a0e61b535600b97e0",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/cline/cline.git",
          "revision": "45403900964a74aa5ae3683a0e61b535600b97e0",
          "ref": "45403900964a74aa5ae3683a0e61b535600b97e0"
        }
      ]
    },
    {
      "id": "prometheus-prometheus",
      "path": "prometheus-prometheus",
      "license": "Apache-2.0",
      "source": {
        "name": "prometheus/prometheus",
        "version": "5542b00b9d5933e29d7b597705c718b764bcc1cb",
        "url": "https://github.com/prometheus/prometheus",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/prometheus/prometheus/license?ref=5542b00b9d5933e29d7b597705c718b764bcc1cb",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/prometheus/prometheus.git",
          "revision": "5542b00b9d5933e29d7b597705c718b764bcc1cb",
          "ref": "5542b00b9d5933e29d7b597705c718b764bcc1cb"
        }
      ]
    },
    {
      "id": "alacritty-alacritty",
      "path": "alacritty-alacritty",
      "license": "Apache-2.0",
      "source": {
        "name": "alacritty/alacritty",
        "version": "1b2b36a64e88068ad02c95fad00ee2fad31c00bf",
        "url": "https://github.com/alacritty/alacritty",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/alacritty/alacritty/license?ref=1b2b36a64e88068ad02c95fad00ee2fad31c00bf",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/alacritty/alacritty.git",
          "revision": "1b2b36a64e88068ad02c95fad00ee2fad31c00bf",
          "ref": "1b2b36a64e88068ad02c95fad00ee2fad31c00bf"
        }
      ]
    },
    {
      "id": "ladybirdbrowser-ladybird",
      "path": "ladybirdbrowser-ladybird",
      "license": "BSD-2-Clause",
      "source": {
        "name": "LadybirdBrowser/ladybird",
        "version": "8d225a329ee852510b4522e04d357c6fdd51d7f7",
        "url": "https://github.com/LadybirdBrowser/ladybird",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/LadybirdBrowser/ladybird/license?ref=8d225a329ee852510b4522e04d357c6fdd51d7f7",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/LadybirdBrowser/ladybird.git",
          "revision": "8d225a329ee852510b4522e04d357c6fdd51d7f7",
          "ref": "8d225a329ee852510b4522e04d357c6fdd51d7f7"
        }
      ]
    },
    {
      "id": "scrapy-scrapy",
      "path": "scrapy-scrapy",
      "license": "BSD-3-Clause",
      "source": {
        "name": "scrapy/scrapy",
        "version": "1bd839b57ddb614664a179b6213f49579bdfd3da",
        "url": "https://github.com/scrapy/scrapy",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/scrapy/scrapy/license?ref=1bd839b57ddb614664a179b6213f49579bdfd3da",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/scrapy/scrapy.git",
          "revision": "1bd839b57ddb614664a179b6213f49579bdfd3da",
          "ref": "1bd839b57ddb614664a179b6213f49579bdfd3da"
        }
      ]
    },
    {
      "id": "mem0ai-mem0",
      "path": "mem0ai-mem0",
      "license": "Apache-2.0",
      "source": {
        "name": "mem0ai/mem0",
        "version": "4debc58a83377b18be81ae1e5969a300736b2fac",
        "url": "https://github.com/mem0ai/mem0",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mem0ai/mem0/license?ref=4debc58a83377b18be81ae1e5969a300736b2fac",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/mem0ai/mem0.git",
          "revision": "4debc58a83377b18be81ae1e5969a300736b2fac",
          "ref": "4debc58a83377b18be81ae1e5969a300736b2fac"
        }
      ]
    },
    {
      "id": "jgraph-drawio-desktop",
      "path": "jgraph-drawio-desktop",
      "license": "Apache-2.0",
      "source": {
        "name": "jgraph/drawio-desktop",
        "version": "403a2cb79f431db13a395f033b67eeebc1631754",
        "url": "https://github.com/jgraph/drawio-desktop",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jgraph/drawio-desktop/license?ref=403a2cb79f431db13a395f033b67eeebc1631754",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/jgraph/drawio-desktop.git",
          "revision": "403a2cb79f431db13a395f033b67eeebc1631754",
          "ref": "403a2cb79f431db13a395f033b67eeebc1631754"
        }
      ]
    },
    {
      "id": "fuellabs-sway",
      "path": "fuellabs-sway",
      "license": "Apache-2.0",
      "source": {
        "name": "FuelLabs/sway",
        "version": "91be236f71fbb541ee6639ef0d955b2b8cf0a658",
        "url": "https://github.com/FuelLabs/sway",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/FuelLabs/sway/license?ref=91be236f71fbb541ee6639ef0d955b2b8cf0a658",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/FuelLabs/sway.git",
          "revision": "91be236f71fbb541ee6639ef0d955b2b8cf0a658",
          "ref": "91be236f71fbb541ee6639ef0d955b2b8cf0a658"
        }
      ]
    },
    {
      "id": "coollabsio-coolify",
      "path": "coollabsio-coolify",
      "license": "Apache-2.0",
      "source": {
        "name": "coollabsio/coolify",
        "version": "940571e16f5a0e6c73cf56b4bb1184bed3d60623",
        "url": "https://github.com/coollabsio/coolify",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/coollabsio/coolify/license?ref=940571e16f5a0e6c73cf56b4bb1184bed3d60623",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "PHP"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/coollabsio/coolify.git",
          "revision": "940571e16f5a0e6c73cf56b4bb1184bed3d60623",
          "ref": "940571e16f5a0e6c73cf56b4bb1184bed3d60623"
        }
      ]
    },
    {
      "id": "spring-projects-spring-framework",
      "path": "spring-projects-spring-framework",
      "license": "Apache-2.0",
      "source": {
        "name": "spring-projects/spring-framework",
        "version": "da4b31c82b567a0531c6980b5172cba1fc7e6ed5",
        "url": "https://github.com/spring-projects/spring-framework",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/spring-projects/spring-framework/license?ref=da4b31c82b567a0531c6980b5172cba1fc7e6ed5",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/spring-projects/spring-framework.git",
          "revision": "da4b31c82b567a0531c6980b5172cba1fc7e6ed5",
          "ref": "da4b31c82b567a0531c6980b5172cba1fc7e6ed5"
        }
      ]
    },
    {
      "id": "sharkdp-bat",
      "path": "sharkdp-bat",
      "license": "Apache-2.0",
      "source": {
        "name": "sharkdp/bat",
        "version": "2ba8db9c14e5794572f5ea338c2b90404c9769cb",
        "url": "https://github.com/sharkdp/bat",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/sharkdp/bat/license?ref=2ba8db9c14e5794572f5ea338c2b90404c9769cb",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/sharkdp/bat.git",
          "revision": "2ba8db9c14e5794572f5ea338c2b90404c9769cb",
          "ref": "2ba8db9c14e5794572f5ea338c2b90404c9769cb"
        }
      ]
    },
    {
      "id": "filosottile-mkcert",
      "path": "filosottile-mkcert",
      "license": "BSD-3-Clause",
      "source": {
        "name": "FiloSottile/mkcert",
        "version": "1c1dc4ed27ed5936046b6398d39cab4d657a2d8e",
        "url": "https://github.com/FiloSottile/mkcert",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/FiloSottile/mkcert/license?ref=1c1dc4ed27ed5936046b6398d39cab4d657a2d8e",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/FiloSottile/mkcert.git",
          "revision": "1c1dc4ed27ed5936046b6398d39cab4d657a2d8e",
          "ref": "1c1dc4ed27ed5936046b6398d39cab4d657a2d8e"
        }
      ]
    },
    {
      "id": "appwrite-appwrite",
      "path": "appwrite-appwrite",
      "license": "BSD-3-Clause",
      "source": {
        "name": "appwrite/appwrite",
        "version": "5d1e08464b2e5785cb21c1eef4604f904788fbb5",
        "url": "https://github.com/appwrite/appwrite",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/appwrite/appwrite/license?ref=5d1e08464b2e5785cb21c1eef4604f904788fbb5",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/appwrite/appwrite.git",
          "revision": "5d1e08464b2e5785cb21c1eef4604f904788fbb5",
          "ref": "5d1e08464b2e5785cb21c1eef4604f904788fbb5"
        }
      ]
    },
    {
      "id": "typst-typst",
      "path": "typst-typst",
      "license": "Apache-2.0",
      "source": {
        "name": "typst/typst",
        "version": "a51e028041cac426f97d34335bb01d8f1d8e5e8f",
        "url": "https://github.com/typst/typst",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/typst/typst/license?ref=a51e028041cac426f97d34335bb01d8f1d8e5e8f",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/typst/typst.git",
          "revision": "a51e028041cac426f97d34335bb01d8f1d8e5e8f",
          "ref": "a51e028041cac426f97d34335bb01d8f1d8e5e8f"
        }
      ]
    },
    {
      "id": "jingyaogong-minimind",
      "path": "jingyaogong-minimind",
      "license": "Apache-2.0",
      "source": {
        "name": "jingyaogong/minimind",
        "version": "393e387e9ad99f0f04c296e4c5e7353f4444629f",
        "url": "https://github.com/jingyaogong/minimind",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jingyaogong/minimind/license?ref=393e387e9ad99f0f04c296e4c5e7353f4444629f",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/jingyaogong/minimind.git",
          "revision": "393e387e9ad99f0f04c296e4c5e7353f4444629f",
          "ref": "393e387e9ad99f0f04c296e4c5e7353f4444629f"
        }
      ]
    },
    {
      "id": "psf-requests",
      "path": "psf-requests",
      "license": "Apache-2.0",
      "source": {
        "name": "psf/requests",
        "version": "1f6589ec3a1ee910f9a65cc3ceac60b26677bc0e",
        "url": "https://github.com/psf/requests",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/psf/requests/license?ref=1f6589ec3a1ee910f9a65cc3ceac60b26677bc0e",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/psf/requests.git",
          "revision": "1f6589ec3a1ee910f9a65cc3ceac60b26677bc0e",
          "ref": "1f6589ec3a1ee910f9a65cc3ceac60b26677bc0e"
        }
      ]
    },
    {
      "id": "mozilla-pdf.js",
      "path": "mozilla-pdf.js",
      "license": "Apache-2.0",
      "source": {
        "name": "mozilla/pdf.js",
        "version": "022e9588728346cde58088a9925120293af1c8f4",
        "url": "https://github.com/mozilla/pdf.js",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mozilla/pdf.js/license?ref=022e9588728346cde58088a9925120293af1c8f4",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/mozilla/pdf.js.git",
          "revision": "022e9588728346cde58088a9925120293af1c8f4",
          "ref": "022e9588728346cde58088a9925120293af1c8f4"
        }
      ]
    },
    {
      "id": "lyswhut-lx-music-desktop",
      "path": "lyswhut-lx-music-desktop",
      "license": "Apache-2.0",
      "source": {
        "name": "lyswhut/lx-music-desktop",
        "version": "9c364b482e5621a1d38b50e8610d2fb974457e6e",
        "url": "https://github.com/lyswhut/lx-music-desktop",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/lyswhut/lx-music-desktop/license?ref=9c364b482e5621a1d38b50e8610d2fb974457e6e",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/lyswhut/lx-music-desktop.git",
          "revision": "9c364b482e5621a1d38b50e8610d2fb974457e6e",
          "ref": "9c364b482e5621a1d38b50e8610d2fb974457e6e"
        }
      ]
    },
    {
      "id": "aaif-goose-goose",
      "path": "aaif-goose-goose",
      "license": "Apache-2.0",
      "source": {
        "name": "aaif-goose/goose",
        "version": "064244e6bddf641876676f054a006b7da1da5182",
        "url": "https://github.com/aaif-goose/goose",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/aaif-goose/goose/license?ref=064244e6bddf641876676f054a006b7da1da5182",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/aaif-goose/goose.git",
          "revision": "064244e6bddf641876676f054a006b7da1da5182",
          "ref": "064244e6bddf641876676f054a006b7da1da5182"
        }
      ]
    },
    {
      "id": "xai-org-grok-1",
      "path": "xai-org-grok-1",
      "license": "Apache-2.0",
      "source": {
        "name": "xai-org/grok-1",
        "version": "7050ed204b8206bb8645c7b7bbef7252f79561b0",
        "url": "https://github.com/xai-org/grok-1",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/xai-org/grok-1/license?ref=7050ed204b8206bb8645c7b7bbef7252f79561b0",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/xai-org/grok-1.git",
          "revision": "7050ed204b8206bb8645c7b7bbef7252f79561b0",
          "ref": "7050ed204b8206bb8645c7b7bbef7252f79561b0"
        }
      ]
    },
    {
      "id": "etcd-io-etcd",
      "path": "etcd-io-etcd",
      "license": "Apache-2.0",
      "source": {
        "name": "etcd-io/etcd",
        "version": "5b75ac62cf042a185e902530c25fd3d59c095232",
        "url": "https://github.com/etcd-io/etcd",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/etcd-io/etcd/license?ref=5b75ac62cf042a185e902530c25fd3d59c095232",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/etcd-io/etcd.git",
          "revision": "5b75ac62cf042a185e902530c25fd3d59c095232",
          "ref": "5b75ac62cf042a185e902530c25fd3d59c095232"
        }
      ]
    },
    {
      "id": "google-guava",
      "path": "google-guava",
      "license": "Apache-2.0",
      "source": {
        "name": "google/guava",
        "version": "0a8e1ec55afe1d9361ebbd0c4149adfbb32ccf9a",
        "url": "https://github.com/google/guava",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/google/guava/license?ref=0a8e1ec55afe1d9361ebbd0c4149adfbb32ccf9a",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/google/guava.git",
          "revision": "0a8e1ec55afe1d9361ebbd0c4149adfbb32ccf9a",
          "ref": "0a8e1ec55afe1d9361ebbd0c4149adfbb32ccf9a"
        }
      ]
    },
    {
      "id": "dbeaver-dbeaver",
      "path": "dbeaver-dbeaver",
      "license": "Apache-2.0",
      "source": {
        "name": "dbeaver/dbeaver",
        "version": "b2122ee6c4bdf914af3f13d42a603a3ab2d25bc0",
        "url": "https://github.com/dbeaver/dbeaver",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/dbeaver/dbeaver/license?ref=b2122ee6c4bdf914af3f13d42a603a3ab2d25bc0",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/dbeaver/dbeaver.git",
          "revision": "b2122ee6c4bdf914af3f13d42a603a3ab2d25bc0",
          "ref": "b2122ee6c4bdf914af3f13d42a603a3ab2d25bc0"
        }
      ]
    },
    {
      "id": "skylot-jadx",
      "path": "skylot-jadx",
      "license": "Apache-2.0",
      "source": {
        "name": "skylot/jadx",
        "version": "e738a26571d02919f01df40de93bc9a44dee4e18",
        "url": "https://github.com/skylot/jadx",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/skylot/jadx/license?ref=e738a26571d02919f01df40de93bc9a44dee4e18",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/skylot/jadx.git",
          "revision": "e738a26571d02919f01df40de93bc9a44dee4e18",
          "ref": "e738a26571d02919f01df40de93bc9a44dee4e18"
        }
      ]
    },
    {
      "id": "pandas-dev-pandas",
      "path": "pandas-dev-pandas",
      "license": "BSD-3-Clause",
      "source": {
        "name": "pandas-dev/pandas",
        "version": "ff1d39bbdf4eda26de2285cf836104f9885b0826",
        "url": "https://github.com/pandas-dev/pandas",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/pandas-dev/pandas/license?ref=ff1d39bbdf4eda26de2285cf836104f9885b0826",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/pandas-dev/pandas.git",
          "revision": "ff1d39bbdf4eda26de2285cf836104f9885b0826",
          "ref": "ff1d39bbdf4eda26de2285cf836104f9885b0826"
        }
      ]
    },
    {
      "id": "homebrew-brew",
      "path": "homebrew-brew",
      "license": "BSD-2-Clause",
      "source": {
        "name": "Homebrew/brew",
        "version": "749b3557ccebae4ecd79f17aa2527d2f68acc739",
        "url": "https://github.com/Homebrew/brew",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Homebrew/brew/license?ref=749b3557ccebae4ecd79f17aa2527d2f68acc739",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Ruby"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Homebrew/brew.git",
          "revision": "749b3557ccebae4ecd79f17aa2527d2f68acc739",
          "ref": "749b3557ccebae4ecd79f17aa2527d2f68acc739"
        }
      ]
    },
    {
      "id": "reactivex-rxjava",
      "path": "reactivex-rxjava",
      "license": "Apache-2.0",
      "source": {
        "name": "ReactiveX/RxJava",
        "version": "8f7b841984133e2a3ba88630779af9e66248ff95",
        "url": "https://github.com/ReactiveX/RxJava",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ReactiveX/RxJava/license?ref=8f7b841984133e2a3ba88630779af9e66248ff95",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ReactiveX/RxJava.git",
          "revision": "8f7b841984133e2a3ba88630779af9e66248ff95",
          "ref": "8f7b841984133e2a3ba88630779af9e66248ff95"
        }
      ]
    },
    {
      "id": "aider-ai-aider",
      "path": "aider-ai-aider",
      "license": "Apache-2.0",
      "source": {
        "name": "Aider-AI/aider",
        "version": "5dc9490bb35f9729ef2c95d00a19ccd30c26339c",
        "url": "https://github.com/Aider-AI/aider",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Aider-AI/aider/license?ref=5dc9490bb35f9729ef2c95d00a19ccd30c26339c",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Aider-AI/aider.git",
          "revision": "5dc9490bb35f9729ef2c95d00a19ccd30c26339c",
          "ref": "5dc9490bb35f9729ef2c95d00a19ccd30c26339c"
        }
      ]
    },
    {
      "id": "prisma-prisma",
      "path": "prisma-prisma",
      "license": "Apache-2.0",
      "source": {
        "name": "prisma/prisma",
        "version": "d55cd02911b0c6675bedaad90cc0e2727d5787ce",
        "url": "https://github.com/prisma/prisma",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/prisma/prisma/license?ref=d55cd02911b0c6675bedaad90cc0e2727d5787ce",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/prisma/prisma.git",
          "revision": "d55cd02911b0c6675bedaad90cc0e2727d5787ce",
          "ref": "d55cd02911b0c6675bedaad90cc0e2727d5787ce"
        }
      ]
    },
    {
      "id": "bevyengine-bevy",
      "path": "bevyengine-bevy",
      "license": "Apache-2.0",
      "source": {
        "name": "bevyengine/bevy",
        "version": "e8b3598ff5e5ec40e8ba84edd5750a1c0e4d4e59",
        "url": "https://github.com/bevyengine/bevy",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bevyengine/bevy/license?ref=e8b3598ff5e5ec40e8ba84edd5750a1c0e4d4e59",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/bevyengine/bevy.git",
          "revision": "e8b3598ff5e5ec40e8ba84edd5750a1c0e4d4e59",
          "ref": "e8b3598ff5e5ec40e8ba84edd5750a1c0e4d4e59"
        }
      ]
    },
    {
      "id": "slab-quill",
      "path": "slab-quill",
      "license": "BSD-3-Clause",
      "source": {
        "name": "slab/quill",
        "version": "539cbffd0a13b18e9c65eb84dd35e6596e403158",
        "url": "https://github.com/slab/quill",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/slab/quill/license?ref=539cbffd0a13b18e9c65eb84dd35e6596e403158",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/slab/quill.git",
          "revision": "539cbffd0a13b18e9c65eb84dd35e6596e403158",
          "ref": "539cbffd0a13b18e9c65eb84dd35e6596e403158"
        }
      ]
    },
    {
      "id": "lysine-dev-okhttp",
      "path": "lysine-dev-okhttp",
      "license": "Apache-2.0",
      "source": {
        "name": "lysine-dev/okhttp",
        "version": "fc9a83dd580f06c52beea5207ffca1a7d99df24e",
        "url": "https://github.com/lysine-dev/okhttp",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/lysine-dev/okhttp/license?ref=fc9a83dd580f06c52beea5207ffca1a7d99df24e",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Kotlin"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/lysine-dev/okhttp.git",
          "revision": "fc9a83dd580f06c52beea5207ffca1a7d99df24e",
          "ref": "fc9a83dd580f06c52beea5207ffca1a7d99df24e"
        }
      ]
    },
    {
      "id": "exo-explore-exo",
      "path": "exo-explore-exo",
      "license": "Apache-2.0",
      "source": {
        "name": "exo-explore/exo",
        "version": "b5375f8cee4368d09e1ce96a56b9f81fb0bc81aa",
        "url": "https://github.com/exo-explore/exo",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/exo-explore/exo/license?ref=b5375f8cee4368d09e1ce96a56b9f81fb0bc81aa",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/exo-explore/exo.git",
          "revision": "b5375f8cee4368d09e1ce96a56b9f81fb0bc81aa",
          "ref": "b5375f8cee4368d09e1ce96a56b9f81fb0bc81aa"
        }
      ]
    },
    {
      "id": "apache-airflow",
      "path": "apache-airflow",
      "license": "Apache-2.0",
      "source": {
        "name": "apache/airflow",
        "version": "1f529f3837ab5e38ddd27ea355a7fbfddd392573",
        "url": "https://github.com/apache/airflow",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/apache/airflow/license?ref=1f529f3837ab5e38ddd27ea355a7fbfddd392573",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/apache/airflow.git",
          "revision": "1f529f3837ab5e38ddd27ea355a7fbfddd392573",
          "ref": "1f529f3837ab5e38ddd27ea355a7fbfddd392573"
        }
      ]
    },
    {
      "id": "android-architecture-samples",
      "path": "android-architecture-samples",
      "license": "Apache-2.0",
      "source": {
        "name": "android/architecture-samples",
        "version": "ee66e1526b84c026615df032c705842b7d2a521f",
        "url": "https://github.com/android/architecture-samples",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/android/architecture-samples/license?ref=ee66e1526b84c026615df032c705842b7d2a521f",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Kotlin"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/android/architecture-samples.git",
          "revision": "ee66e1526b84c026615df032c705842b7d2a521f",
          "ref": "ee66e1526b84c026615df032c705842b7d2a521f"
        }
      ]
    },
    {
      "id": "google-zx",
      "path": "google-zx",
      "license": "Apache-2.0",
      "source": {
        "name": "google/zx",
        "version": "00a2c484e219c2e84bfc3a199febf7fbce2cfbf4",
        "url": "https://github.com/google/zx",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/google/zx/license?ref=00a2c484e219c2e84bfc3a199febf7fbce2cfbf4",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/google/zx.git",
          "revision": "00a2c484e219c2e84bfc3a199febf7fbce2cfbf4",
          "ref": "00a2c484e219c2e84bfc3a199febf7fbce2cfbf4"
        }
      ]
    },
    {
      "id": "milvus-io-milvus",
      "path": "milvus-io-milvus",
      "license": "Apache-2.0",
      "source": {
        "name": "milvus-io/milvus",
        "version": "025d2e3e75d38f4edd8d5b8536d514e777a47559",
        "url": "https://github.com/milvus-io/milvus",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/milvus-io/milvus/license?ref=025d2e3e75d38f4edd8d5b8536d514e777a47559",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/milvus-io/milvus.git",
          "revision": "025d2e3e75d38f4edd8d5b8536d514e777a47559",
          "ref": "025d2e3e75d38f4edd8d5b8536d514e777a47559"
        }
      ]
    },
    {
      "id": "streamlit-streamlit",
      "path": "streamlit-streamlit",
      "license": "Apache-2.0",
      "source": {
        "name": "streamlit/streamlit",
        "version": "97eada51b426a81884955906d75407d1270545f9",
        "url": "https://github.com/streamlit/streamlit",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/streamlit/streamlit/license?ref=97eada51b426a81884955906d75407d1270545f9",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/streamlit/streamlit.git",
          "revision": "97eada51b426a81884955906d75407d1270545f9",
          "ref": "97eada51b426a81884955906d75407d1270545f9"
        }
      ]
    },
    {
      "id": "leaflet-leaflet",
      "path": "leaflet-leaflet",
      "license": "BSD-2-Clause",
      "source": {
        "name": "Leaflet/Leaflet",
        "version": "c96f31a7a350a07cfbc852cf88e6ca69af5f5ec9",
        "url": "https://github.com/Leaflet/Leaflet",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Leaflet/Leaflet/license?ref=c96f31a7a350a07cfbc852cf88e6ca69af5f5ec9",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Leaflet/Leaflet.git",
          "revision": "c96f31a7a350a07cfbc852cf88e6ca69af5f5ec9",
          "ref": "c96f31a7a350a07cfbc852cf88e6ca69af5f5ec9"
        }
      ]
    },
    {
      "id": "grpc-grpc",
      "path": "grpc-grpc",
      "license": "Apache-2.0",
      "source": {
        "name": "grpc/grpc",
        "version": "b6449efc3e9968eb022a2cf7a043b4317adde589",
        "url": "https://github.com/grpc/grpc",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/grpc/grpc/license?ref=b6449efc3e9968eb022a2cf7a043b4317adde589",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/grpc/grpc.git",
          "revision": "b6449efc3e9968eb022a2cf7a043b4317adde589",
          "ref": "b6449efc3e9968eb022a2cf7a043b4317adde589"
        }
      ]
    },
    {
      "id": "spf13-cobra",
      "path": "spf13-cobra",
      "license": "Apache-2.0",
      "source": {
        "name": "spf13/cobra",
        "version": "adbc8813901bba65827259daa8e22ff94ec1f30e",
        "url": "https://github.com/spf13/cobra",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/spf13/cobra/license?ref=adbc8813901bba65827259daa8e22ff94ec1f30e",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/spf13/cobra.git",
          "revision": "adbc8813901bba65827259daa8e22ff94ec1f30e",
          "ref": "adbc8813901bba65827259daa8e22ff94ec1f30e"
        }
      ]
    },
    {
      "id": "aykutsarac-jsoncrack.com",
      "path": "aykutsarac-jsoncrack.com",
      "license": "Apache-2.0",
      "source": {
        "name": "AykutSarac/jsoncrack.com",
        "version": "3c9af69e23c635356293b6b28cf4cd0af10d1059",
        "url": "https://github.com/AykutSarac/jsoncrack.com",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/AykutSarac/jsoncrack.com/license?ref=3c9af69e23c635356293b6b28cf4cd0af10d1059",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/AykutSarac/jsoncrack.com.git",
          "revision": "3c9af69e23c635356293b6b28cf4cd0af10d1059",
          "ref": "3c9af69e23c635356293b6b28cf4cd0af10d1059"
        }
      ]
    },
    {
      "id": "sharkdp-fd",
      "path": "sharkdp-fd",
      "license": "Apache-2.0",
      "source": {
        "name": "sharkdp/fd",
        "version": "0f1f9676dcf7bc5af814469a74a0d878449cde80",
        "url": "https://github.com/sharkdp/fd",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/sharkdp/fd/license?ref=0f1f9676dcf7bc5af814469a74a0d878449cde80",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/sharkdp/fd.git",
          "revision": "0f1f9676dcf7bc5af814469a74a0d878449cde80",
          "ref": "0f1f9676dcf7bc5af814469a74a0d878449cde80"
        }
      ]
    },
    {
      "id": "kong-kong",
      "path": "kong-kong",
      "license": "Apache-2.0",
      "source": {
        "name": "Kong/kong",
        "version": "fa9c3b695af72668f135cb17bbb84a8b4dc511d2",
        "url": "https://github.com/Kong/kong",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Kong/kong/license?ref=fa9c3b695af72668f135cb17bbb84a8b4dc511d2",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Lua"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Kong/kong.git",
          "revision": "fa9c3b695af72668f135cb17bbb84a8b4dc511d2",
          "ref": "fa9c3b695af72668f135cb17bbb84a8b4dc511d2"
        }
      ]
    },
    {
      "id": "lysine-dev-retrofit",
      "path": "lysine-dev-retrofit",
      "license": "Apache-2.0",
      "source": {
        "name": "lysine-dev/retrofit",
        "version": "d0b112dad073b7fe49c953ebc46ff1b424cb1e51",
        "url": "https://github.com/lysine-dev/retrofit",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/lysine-dev/retrofit/license?ref=d0b112dad073b7fe49c953ebc46ff1b424cb1e51",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/lysine-dev/retrofit.git",
          "revision": "d0b112dad073b7fe49c953ebc46ff1b424cb1e51",
          "ref": "d0b112dad073b7fe49c953ebc46ff1b424cb1e51"
        }
      ]
    },
    {
      "id": "apache-spark",
      "path": "apache-spark",
      "license": "Apache-2.0",
      "source": {
        "name": "apache/spark",
        "version": "f896d8d0d40a859f0c40ef99dac3fb2bba5035e7",
        "url": "https://github.com/apache/spark",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/apache/spark/license?ref=f896d8d0d40a859f0c40ef99dac3fb2bba5035e7",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Scala"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/apache/spark.git",
          "revision": "f896d8d0d40a859f0c40ef99dac3fb2bba5035e7",
          "ref": "f896d8d0d40a859f0c40ef99dac3fb2bba5035e7"
        }
      ]
    },
    {
      "id": "ray-project-ray",
      "path": "ray-project-ray",
      "license": "Apache-2.0",
      "source": {
        "name": "ray-project/ray",
        "version": "12436ea75080433a9134cfa362b3dbb98fe9e73f",
        "url": "https://github.com/ray-project/ray",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ray-project/ray/license?ref=12436ea75080433a9134cfa362b3dbb98fe9e73f",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/ray-project/ray.git",
          "revision": "12436ea75080433a9134cfa362b3dbb98fe9e73f",
          "ref": "12436ea75080433a9134cfa362b3dbb98fe9e73f"
        }
      ]
    },
    {
      "id": "juspay-hyperswitch",
      "path": "juspay-hyperswitch",
      "license": "Apache-2.0",
      "source": {
        "name": "juspay/hyperswitch",
        "version": "77c45d76b2b70a5b127d11a6b6755d2793b021f9",
        "url": "https://github.com/juspay/hyperswitch",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/juspay/hyperswitch/license?ref=77c45d76b2b70a5b127d11a6b6755d2793b021f9",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/juspay/hyperswitch.git",
          "revision": "77c45d76b2b70a5b127d11a6b6755d2793b021f9",
          "ref": "77c45d76b2b70a5b127d11a6b6755d2793b021f9"
        }
      ]
    },
    {
      "id": "fuellabs-fuels-rs",
      "path": "fuellabs-fuels-rs",
      "license": "Apache-2.0",
      "source": {
        "name": "FuelLabs/fuels-rs",
        "version": "d9a250a51818dda64bfeb5ef7cc19cf27bdcd623",
        "url": "https://github.com/FuelLabs/fuels-rs",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/FuelLabs/fuels-rs/license?ref=d9a250a51818dda64bfeb5ef7cc19cf27bdcd623",
          "declaration": "Apache-2.0"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Rust"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/FuelLabs/fuels-rs.git",
          "revision": "d9a250a51818dda64bfeb5ef7cc19cf27bdcd623",
          "ref": "d9a250a51818dda64bfeb5ef7cc19cf27bdcd623"
        }
      ]
    },
    {
      "id": "juanfont-headscale",
      "path": "juanfont-headscale",
      "license": "BSD-3-Clause",
      "source": {
        "name": "juanfont/headscale",
        "version": "565fd254d06c4c7f9a8cad1714a43445c79ba420",
        "url": "https://github.com/juanfont/headscale",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/juanfont/headscale/license?ref=565fd254d06c4c7f9a8cad1714a43445c79ba420",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/juanfont/headscale.git",
          "revision": "565fd254d06c4c7f9a8cad1714a43445c79ba420",
          "ref": "565fd254d06c4c7f9a8cad1714a43445c79ba420"
        }
      ]
    },
    {
      "id": "php-php-src",
      "path": "php-php-src",
      "license": "BSD-3-Clause",
      "source": {
        "name": "php/php-src",
        "version": "b9b44872d72dc66bcea72232a2bc79a3b63a0c3b",
        "url": "https://github.com/php/php-src",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/php/php-src/license?ref=b9b44872d72dc66bcea72232a2bc79a3b63a0c3b",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/php/php-src.git",
          "revision": "b9b44872d72dc66bcea72232a2bc79a3b63a0c3b",
          "ref": "b9b44872d72dc66bcea72232a2bc79a3b63a0c3b"
        }
      ]
    },
    {
      "id": "google-leveldb",
      "path": "google-leveldb",
      "license": "BSD-3-Clause",
      "source": {
        "name": "google/leveldb",
        "version": "7ee830d02b623e8ffe0b95d59a74db1e58da04c5",
        "url": "https://github.com/google/leveldb",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/google/leveldb/license?ref=7ee830d02b623e8ffe0b95d59a74db1e58da04c5",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/google/leveldb.git",
          "revision": "7ee830d02b623e8ffe0b95d59a74db1e58da04c5",
          "ref": "7ee830d02b623e8ffe0b95d59a74db1e58da04c5"
        }
      ]
    },
    {
      "id": "google-googletest",
      "path": "google-googletest",
      "license": "BSD-3-Clause",
      "source": {
        "name": "google/googletest",
        "version": "d89aac5f0dd4021198d903d39de16f896726de21",
        "url": "https://github.com/google/googletest",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/google/googletest/license?ref=d89aac5f0dd4021198d903d39de16f896726de21",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/google/googletest.git",
          "revision": "d89aac5f0dd4021198d903d39de16f896726de21",
          "ref": "d89aac5f0dd4021198d903d39de16f896726de21"
        }
      ]
    },
    {
      "id": "httpie-cli",
      "path": "httpie-cli",
      "license": "BSD-3-Clause",
      "source": {
        "name": "httpie/cli",
        "version": "5b604c37c6c67e18e7c3e9aee6c88a8c22b98345",
        "url": "https://github.com/httpie/cli",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/httpie/cli/license?ref=5b604c37c6c67e18e7c3e9aee6c88a8c22b98345",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/httpie/cli.git",
          "revision": "5b604c37c6c67e18e7c3e9aee6c88a8c22b98345",
          "ref": "5b604c37c6c67e18e7c3e9aee6c88a8c22b98345"
        }
      ]
    },
    {
      "id": "hyprwm-hyprland",
      "path": "hyprwm-hyprland",
      "license": "BSD-3-Clause",
      "source": {
        "name": "hyprwm/Hyprland",
        "version": "5dee44a72476be67789f64e6c6bffae0df28c53a",
        "url": "https://github.com/hyprwm/Hyprland",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/hyprwm/Hyprland/license?ref=5dee44a72476be67789f64e6c6bffae0df28c53a",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/hyprwm/Hyprland.git",
          "revision": "5dee44a72476be67789f64e6c6bffae0df28c53a",
          "ref": "5dee44a72476be67789f64e6c6bffae0df28c53a"
        }
      ]
    },
    {
      "id": "xinntao-real-esrgan",
      "path": "xinntao-real-esrgan",
      "license": "BSD-3-Clause",
      "source": {
        "name": "xinntao/Real-ESRGAN",
        "version": "a4abfb2979a7bbff3f69f58f58ae324608821e27",
        "url": "https://github.com/xinntao/Real-ESRGAN",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/xinntao/Real-ESRGAN/license?ref=a4abfb2979a7bbff3f69f58f58ae324608821e27",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/xinntao/Real-ESRGAN.git",
          "revision": "a4abfb2979a7bbff3f69f58f58ae324608821e27",
          "ref": "a4abfb2979a7bbff3f69f58f58ae324608821e27"
        }
      ]
    },
    {
      "id": "restic-restic",
      "path": "restic-restic",
      "license": "BSD-2-Clause",
      "source": {
        "name": "restic/restic",
        "version": "a80be1478a4c537f8396e0db2b05120aa78f11e0",
        "url": "https://github.com/restic/restic",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/restic/restic/license?ref=a80be1478a4c537f8396e0db2b05120aa78f11e0",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/restic/restic.git",
          "revision": "a80be1478a4c537f8396e0db2b05120aa78f11e0",
          "ref": "a80be1478a4c537f8396e0db2b05120aa78f11e0"
        }
      ]
    },
    {
      "id": "tailscale-tailscale",
      "path": "tailscale-tailscale",
      "license": "BSD-3-Clause",
      "source": {
        "name": "tailscale/tailscale",
        "version": "e592a0c36398be8a435d1cc9e039c732c540051c",
        "url": "https://github.com/tailscale/tailscale",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/tailscale/tailscale/license?ref=e592a0c36398be8a435d1cc9e039c732c540051c",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/tailscale/tailscale.git",
          "revision": "e592a0c36398be8a435d1cc9e039c732c540051c",
          "ref": "e592a0c36398be8a435d1cc9e039c732c540051c"
        }
      ]
    },
    {
      "id": "serenityos-serenity",
      "path": "serenityos-serenity",
      "license": "BSD-2-Clause",
      "source": {
        "name": "SerenityOS/serenity",
        "version": "93af8693d6868799635ff0bee2b7ca30746f39a9",
        "url": "https://github.com/SerenityOS/serenity",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/SerenityOS/serenity/license?ref=93af8693d6868799635ff0bee2b7ca30746f39a9",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C++"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/SerenityOS/serenity.git",
          "revision": "93af8693d6868799635ff0bee2b7ca30746f39a9",
          "ref": "93af8693d6868799635ff0bee2b7ca30746f39a9"
        }
      ]
    },
    {
      "id": "nginx-nginx",
      "path": "nginx-nginx",
      "license": "BSD-2-Clause",
      "source": {
        "name": "nginx/nginx",
        "version": "dea68dbf126f40a8acd09bac885a955be459162e",
        "url": "https://github.com/nginx/nginx",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/nginx/nginx/license?ref=dea68dbf126f40a8acd09bac885a955be459162e",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/nginx/nginx.git",
          "revision": "dea68dbf126f40a8acd09bac885a955be459162e",
          "ref": "dea68dbf126f40a8acd09bac885a955be459162e"
        }
      ]
    },
    {
      "id": "getredash-redash",
      "path": "getredash-redash",
      "license": "BSD-2-Clause",
      "source": {
        "name": "getredash/redash",
        "version": "2daefd2f78b270a6a566a86251d8bbd841d394d3",
        "url": "https://github.com/getredash/redash",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/getredash/redash/license?ref=2daefd2f78b270a6a566a86251d8bbd841d394d3",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Python"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/getredash/redash.git",
          "revision": "2daefd2f78b270a6a566a86251d8bbd841d394d3",
          "ref": "2daefd2f78b270a6a566a86251d8bbd841d394d3"
        }
      ]
    },
    {
      "id": "fyne-io-fyne",
      "path": "fyne-io-fyne",
      "license": "BSD-3-Clause",
      "source": {
        "name": "fyne-io/fyne",
        "version": "57f5b07179b833e781522f8a32c160312d94ede1",
        "url": "https://github.com/fyne-io/fyne",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/fyne-io/fyne/license?ref=57f5b07179b833e781522f8a32c160312d94ede1",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/fyne-io/fyne.git",
          "revision": "57f5b07179b833e781522f8a32c160312d94ede1",
          "ref": "57f5b07179b833e781522f8a32c160312d94ede1"
        }
      ]
    },
    {
      "id": "pppscn-smsforwarder",
      "path": "pppscn-smsforwarder",
      "license": "BSD-2-Clause",
      "source": {
        "name": "pppscn/SmsForwarder",
        "version": "ce931a03739a6a2b0dfc83161bf812a94fd5e45e",
        "url": "https://github.com/pppscn/SmsForwarder",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/pppscn/SmsForwarder/license?ref=ce931a03739a6a2b0dfc83161bf812a94fd5e45e",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Kotlin"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/pppscn/SmsForwarder.git",
          "revision": "ce931a03739a6a2b0dfc83161bf812a94fd5e45e",
          "ref": "ce931a03739a6a2b0dfc83161bf812a94fd5e45e"
        }
      ]
    },
    {
      "id": "valkey-io-valkey",
      "path": "valkey-io-valkey",
      "license": "BSD-3-Clause",
      "source": {
        "name": "valkey-io/valkey",
        "version": "2d69e5e9b7c27d3a49cef67aa61ad306d107bfd1",
        "url": "https://github.com/valkey-io/valkey",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/valkey-io/valkey/license?ref=2d69e5e9b7c27d3a49cef67aa61ad306d107bfd1",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/valkey-io/valkey.git",
          "revision": "2d69e5e9b7c27d3a49cef67aa61ad306d107bfd1",
          "ref": "2d69e5e9b7c27d3a49cef67aa61ad306d107bfd1"
        }
      ]
    },
    {
      "id": "kataras-iris",
      "path": "kataras-iris",
      "license": "BSD-3-Clause",
      "source": {
        "name": "kataras/iris",
        "version": "7bedaf55a0b64bbb2248a5845a2c60d81a30996a",
        "url": "https://github.com/kataras/iris",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/kataras/iris/license?ref=7bedaf55a0b64bbb2248a5845a2c60d81a30996a",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/kataras/iris.git",
          "revision": "7bedaf55a0b64bbb2248a5845a2c60d81a30996a",
          "ref": "7bedaf55a0b64bbb2248a5845a2c60d81a30996a"
        }
      ]
    },
    {
      "id": "highlightjs-highlight.js",
      "path": "highlightjs-highlight.js",
      "license": "BSD-3-Clause",
      "source": {
        "name": "highlightjs/highlight.js",
        "version": "4d4268d701e30b0954149e9eb3bc9c4d9e15d550",
        "url": "https://github.com/highlightjs/highlight.js",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/highlightjs/highlight.js/license?ref=4d4268d701e30b0954149e9eb3bc9c4d9e15d550",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/highlightjs/highlight.js.git",
          "revision": "4d4268d701e30b0954149e9eb3bc9c4d9e15d550",
          "ref": "4d4268d701e30b0954149e9eb3bc9c4d9e15d550"
        }
      ]
    },
    {
      "id": "copy-v86",
      "path": "copy-v86",
      "license": "BSD-2-Clause",
      "source": {
        "name": "copy/v86",
        "version": "6eda8ff53a7d2e0e6e3edb3c43b0a4757dcf24a6",
        "url": "https://github.com/copy/v86",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/copy/v86/license?ref=6eda8ff53a7d2e0e6e3edb3c43b0a4757dcf24a6",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/copy/v86.git",
          "revision": "6eda8ff53a7d2e0e6e3edb3c43b0a4757dcf24a6",
          "ref": "6eda8ff53a7d2e0e6e3edb3c43b0a4757dcf24a6"
        }
      ]
    },
    {
      "id": "filosottile-age",
      "path": "filosottile-age",
      "license": "BSD-3-Clause",
      "source": {
        "name": "FiloSottile/age",
        "version": "706dfc1e799a03443ae46023502bd88d4e9e324f",
        "url": "https://github.com/FiloSottile/age",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/FiloSottile/age/license?ref=706dfc1e799a03443ae46023502bd88d4e9e324f",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/FiloSottile/age.git",
          "revision": "706dfc1e799a03443ae46023502bd88d4e9e324f",
          "ref": "706dfc1e799a03443ae46023502bd88d4e9e324f"
        }
      ]
    },
    {
      "id": "zsh-users-zsh-syntax-highlighting",
      "path": "zsh-users-zsh-syntax-highlighting",
      "license": "BSD-3-Clause",
      "source": {
        "name": "zsh-users/zsh-syntax-highlighting",
        "version": "c4d95591843d49838b7ad30081e7aba3135a6703",
        "url": "https://github.com/zsh-users/zsh-syntax-highlighting",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/zsh-users/zsh-syntax-highlighting/license?ref=c4d95591843d49838b7ad30081e7aba3135a6703",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Shell"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/zsh-users/zsh-syntax-highlighting.git",
          "revision": "c4d95591843d49838b7ad30081e7aba3135a6703",
          "ref": "c4d95591843d49838b7ad30081e7aba3135a6703"
        }
      ]
    },
    {
      "id": "redis-go-redis",
      "path": "redis-go-redis",
      "license": "BSD-2-Clause",
      "source": {
        "name": "redis/go-redis",
        "version": "36d97525cd8076aed67cddf54778e9ea84550929",
        "url": "https://github.com/redis/go-redis",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/redis/go-redis/license?ref=36d97525cd8076aed67cddf54778e9ea84550929",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/redis/go-redis.git",
          "revision": "36d97525cd8076aed67cddf54778e9ea84550929",
          "ref": "36d97525cd8076aed67cddf54778e9ea84550929"
        }
      ]
    },
    {
      "id": "homebrew-homebrew-cask",
      "path": "homebrew-homebrew-cask",
      "license": "BSD-2-Clause",
      "source": {
        "name": "Homebrew/homebrew-cask",
        "version": "a5ae7dad7f4d23844499bf4ac502ecbe382b0e9b",
        "url": "https://github.com/Homebrew/homebrew-cask",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Homebrew/homebrew-cask/license?ref=a5ae7dad7f4d23844499bf4ac502ecbe382b0e9b",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Ruby"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Homebrew/homebrew-cask.git",
          "revision": "a5ae7dad7f4d23844499bf4ac502ecbe382b0e9b",
          "ref": "a5ae7dad7f4d23844499bf4ac502ecbe382b0e9b"
        }
      ]
    },
    {
      "id": "gorilla-mux",
      "path": "gorilla-mux",
      "license": "BSD-3-Clause",
      "source": {
        "name": "gorilla/mux",
        "version": "db9d1d0073d27a0a2d9a8c1bc52aa0af4374d265",
        "url": "https://github.com/gorilla/mux",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/gorilla/mux/license?ref=db9d1d0073d27a0a2d9a8c1bc52aa0af4374d265",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/gorilla/mux.git",
          "revision": "db9d1d0073d27a0a2d9a8c1bc52aa0af4374d265",
          "ref": "db9d1d0073d27a0a2d9a8c1bc52aa0af4374d265"
        }
      ]
    },
    {
      "id": "jarun-nnn",
      "path": "jarun-nnn",
      "license": "BSD-2-Clause",
      "source": {
        "name": "jarun/nnn",
        "version": "53fdae65eef6cb35afaf1e1c2abef3242f48153b",
        "url": "https://github.com/jarun/nnn",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jarun/nnn/license?ref=53fdae65eef6cb35afaf1e1c2abef3242f48153b",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/jarun/nnn.git",
          "revision": "53fdae65eef6cb35afaf1e1c2abef3242f48153b",
          "ref": "53fdae65eef6cb35afaf1e1c2abef3242f48153b"
        }
      ]
    },
    {
      "id": "lit-lit",
      "path": "lit-lit",
      "license": "BSD-3-Clause",
      "source": {
        "name": "lit/lit",
        "version": "c42ee1e96b8fd61f7256f61d715daef572e76e52",
        "url": "https://github.com/lit/lit",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/lit/lit/license?ref=c42ee1e96b8fd61f7256f61d715daef572e76e52",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/lit/lit.git",
          "revision": "c42ee1e96b8fd61f7256f61d715daef572e76e52",
          "ref": "c42ee1e96b8fd61f7256f61d715daef572e76e52"
        }
      ]
    },
    {
      "id": "qax-os-excelize",
      "path": "qax-os-excelize",
      "license": "BSD-3-Clause",
      "source": {
        "name": "qax-os/excelize",
        "version": "a54c578af309fa81f448143ed2b7a91192cc58a7",
        "url": "https://github.com/qax-os/excelize",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/qax-os/excelize/license?ref=a54c578af309fa81f448143ed2b7a91192cc58a7",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/qax-os/excelize.git",
          "revision": "a54c578af309fa81f448143ed2b7a91192cc58a7",
          "ref": "a54c578af309fa81f448143ed2b7a91192cc58a7"
        }
      ]
    },
    {
      "id": "motdotla-dotenv",
      "path": "motdotla-dotenv",
      "license": "BSD-2-Clause",
      "source": {
        "name": "motdotla/dotenv",
        "version": "2fc7eac8ad77cbd5f7814355c7fa352dbcf3c358",
        "url": "https://github.com/motdotla/dotenv",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/motdotla/dotenv/license?ref=2fc7eac8ad77cbd5f7814355c7fa352dbcf3c358",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/motdotla/dotenv.git",
          "revision": "2fc7eac8ad77cbd5f7814355c7fa352dbcf3c358",
          "ref": "2fc7eac8ad77cbd5f7814355c7fa352dbcf3c358"
        }
      ]
    },
    {
      "id": "bokeh-bokeh",
      "path": "bokeh-bokeh",
      "license": "BSD-3-Clause",
      "source": {
        "name": "bokeh/bokeh",
        "version": "681880b19108a37e159b7a3d185611f04112c47b",
        "url": "https://github.com/bokeh/bokeh",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bokeh/bokeh/license?ref=681880b19108a37e159b7a3d185611f04112c47b",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/bokeh/bokeh.git",
          "revision": "681880b19108a37e159b7a3d185611f04112c47b",
          "ref": "681880b19108a37e159b7a3d185611f04112c47b"
        }
      ]
    },
    {
      "id": "bradlarson-gpuimage",
      "path": "bradlarson-gpuimage",
      "license": "BSD-3-Clause",
      "source": {
        "name": "BradLarson/GPUImage",
        "version": "167b0389bc6e9dc4bb0121550f91d8d5d6412c53",
        "url": "https://github.com/BradLarson/GPUImage",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/BradLarson/GPUImage/license?ref=167b0389bc6e9dc4bb0121550f91d8d5d6412c53",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Objective-C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/BradLarson/GPUImage.git",
          "revision": "167b0389bc6e9dc4bb0121550f91d8d5d6412c53",
          "ref": "167b0389bc6e9dc4bb0121550f91d8d5d6412c53"
        }
      ]
    },
    {
      "id": "sebastianbergmann-phpunit",
      "path": "sebastianbergmann-phpunit",
      "license": "BSD-3-Clause",
      "source": {
        "name": "sebastianbergmann/phpunit",
        "version": "6917e76ff5762f4b70203b58608f6bba360cc2c2",
        "url": "https://github.com/sebastianbergmann/phpunit",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/sebastianbergmann/phpunit/license?ref=6917e76ff5762f4b70203b58608f6bba360cc2c2",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "PHP"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/sebastianbergmann/phpunit.git",
          "revision": "6917e76ff5762f4b70203b58608f6bba360cc2c2",
          "ref": "6917e76ff5762f4b70203b58608f6bba360cc2c2"
        }
      ]
    },
    {
      "id": "grpc-ecosystem-grpc-gateway",
      "path": "grpc-ecosystem-grpc-gateway",
      "license": "BSD-3-Clause",
      "source": {
        "name": "grpc-ecosystem/grpc-gateway",
        "version": "c59e315f9f70e99a2dcb7a2b6ca0f9ab15b1d8be",
        "url": "https://github.com/grpc-ecosystem/grpc-gateway",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/grpc-ecosystem/grpc-gateway/license?ref=c59e315f9f70e99a2dcb7a2b6ca0f9ab15b1d8be",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/grpc-ecosystem/grpc-gateway.git",
          "revision": "c59e315f9f70e99a2dcb7a2b6ca0f9ab15b1d8be",
          "ref": "c59e315f9f70e99a2dcb7a2b6ca0f9ab15b1d8be"
        }
      ]
    },
    {
      "id": "antlr-antlr4",
      "path": "antlr-antlr4",
      "license": "BSD-3-Clause",
      "source": {
        "name": "antlr/antlr4",
        "version": "7d5770395bb7b02eb56e7c62662cb1d7c08f42a3",
        "url": "https://github.com/antlr/antlr4",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/antlr/antlr4/license?ref=7d5770395bb7b02eb56e7c62662cb1d7c08f42a3",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Java"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/antlr/antlr4.git",
          "revision": "7d5770395bb7b02eb56e7c62662cb1d7c08f42a3",
          "ref": "7d5770395bb7b02eb56e7c62662cb1d7c08f42a3"
        }
      ]
    },
    {
      "id": "compiler-explorer-compiler-explorer",
      "path": "compiler-explorer-compiler-explorer",
      "license": "BSD-2-Clause",
      "source": {
        "name": "compiler-explorer/compiler-explorer",
        "version": "2854ef3dfb93bd9cac85afce5a1d5c1b47093e2d",
        "url": "https://github.com/compiler-explorer/compiler-explorer",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/compiler-explorer/compiler-explorer/license?ref=2854ef3dfb93bd9cac85afce5a1d5c1b47093e2d",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/compiler-explorer/compiler-explorer.git",
          "revision": "2854ef3dfb93bd9cac85afce5a1d5c1b47093e2d",
          "ref": "2854ef3dfb93bd9cac85afce5a1d5c1b47093e2d"
        }
      ]
    },
    {
      "id": "joewalnes-websocketd",
      "path": "joewalnes-websocketd",
      "license": "BSD-2-Clause",
      "source": {
        "name": "joewalnes/websocketd",
        "version": "d1a43cab937a6a534ca18a44b971a9eb0ea55515",
        "url": "https://github.com/joewalnes/websocketd",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/joewalnes/websocketd/license?ref=d1a43cab937a6a534ca18a44b971a9eb0ea55515",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/joewalnes/websocketd.git",
          "revision": "d1a43cab937a6a534ca18a44b971a9eb0ea55515",
          "ref": "d1a43cab937a6a534ca18a44b971a9eb0ea55515"
        }
      ]
    },
    {
      "id": "nikic-php-parser",
      "path": "nikic-php-parser",
      "license": "BSD-3-Clause",
      "source": {
        "name": "nikic/PHP-Parser",
        "version": "fbd47f7ebcbb450138d92642a0a53b72a5285dda",
        "url": "https://github.com/nikic/PHP-Parser",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/nikic/PHP-Parser/license?ref=fbd47f7ebcbb450138d92642a0a53b72a5285dda",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "PHP"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/nikic/PHP-Parser.git",
          "revision": "fbd47f7ebcbb450138d92642a0a53b72a5285dda",
          "ref": "fbd47f7ebcbb450138d92642a0a53b72a5285dda"
        }
      ]
    },
    {
      "id": "bkaradzic-bgfx",
      "path": "bkaradzic-bgfx",
      "license": "BSD-2-Clause",
      "source": {
        "name": "bkaradzic/bgfx",
        "version": "cb2b1edbbe8a5e5a7c7e363d650cc4000dcbe51f",
        "url": "https://github.com/bkaradzic/bgfx",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bkaradzic/bgfx/license?ref=cb2b1edbbe8a5e5a7c7e363d650cc4000dcbe51f",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/bkaradzic/bgfx.git",
          "revision": "cb2b1edbbe8a5e5a7c7e363d650cc4000dcbe51f",
          "ref": "cb2b1edbbe8a5e5a7c7e363d650cc4000dcbe51f"
        }
      ]
    },
    {
      "id": "weaviate-weaviate",
      "path": "weaviate-weaviate",
      "license": "BSD-3-Clause",
      "source": {
        "name": "weaviate/weaviate",
        "version": "e6e3aa9e89786573fa2e97baf7347a2248ed50b7",
        "url": "https://github.com/weaviate/weaviate",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/weaviate/weaviate/license?ref=e6e3aa9e89786573fa2e97baf7347a2248ed50b7",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/weaviate/weaviate.git",
          "revision": "e6e3aa9e89786573fa2e97baf7347a2248ed50b7",
          "ref": "e6e3aa9e89786573fa2e97baf7347a2248ed50b7"
        }
      ]
    },
    {
      "id": "javascript-obfuscator-javascript-obfuscator",
      "path": "javascript-obfuscator-javascript-obfuscator",
      "license": "BSD-2-Clause",
      "source": {
        "name": "javascript-obfuscator/javascript-obfuscator",
        "version": "c948c1b43350fba818d7eceec6237cd2d467c8a9",
        "url": "https://github.com/javascript-obfuscator/javascript-obfuscator",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/javascript-obfuscator/javascript-obfuscator/license?ref=c948c1b43350fba818d7eceec6237cd2d467c8a9",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/javascript-obfuscator/javascript-obfuscator.git",
          "revision": "c948c1b43350fba818d7eceec6237cd2d467c8a9",
          "ref": "c948c1b43350fba818d7eceec6237cd2d467c8a9"
        }
      ]
    },
    {
      "id": "spree-spree",
      "path": "spree-spree",
      "license": "BSD-3-Clause",
      "source": {
        "name": "spree/spree",
        "version": "547e59959f9d8ca49b35f6aeb3f6ccecdf0ad1f8",
        "url": "https://github.com/spree/spree",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/spree/spree/license?ref=547e59959f9d8ca49b35f6aeb3f6ccecdf0ad1f8",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Ruby"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/spree/spree.git",
          "revision": "547e59959f9d8ca49b35f6aeb3f6ccecdf0ad1f8",
          "ref": "547e59959f9d8ca49b35f6aeb3f6ccecdf0ad1f8"
        }
      ]
    },
    {
      "id": "homebrew-homebrew-core",
      "path": "homebrew-homebrew-core",
      "license": "BSD-2-Clause",
      "source": {
        "name": "Homebrew/homebrew-core",
        "version": "243e5132e70af65a9179c4300fac9fcda0dbd2d2",
        "url": "https://github.com/Homebrew/homebrew-core",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Homebrew/homebrew-core/license?ref=243e5132e70af65a9179c4300fac9fcda0dbd2d2",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Ruby"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/Homebrew/homebrew-core.git",
          "revision": "243e5132e70af65a9179c4300fac9fcda0dbd2d2",
          "ref": "243e5132e70af65a9179c4300fac9fcda0dbd2d2"
        }
      ]
    },
    {
      "id": "kgretzky-evilginx2",
      "path": "kgretzky-evilginx2",
      "license": "BSD-3-Clause",
      "source": {
        "name": "kgretzky/evilginx2",
        "version": "4c0988a1d9db4d172a185e979a38bfd0efdb5830",
        "url": "https://github.com/kgretzky/evilginx2",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/kgretzky/evilginx2/license?ref=4c0988a1d9db4d172a185e979a38bfd0efdb5830",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/kgretzky/evilginx2.git",
          "revision": "4c0988a1d9db4d172a185e979a38bfd0efdb5830",
          "ref": "4c0988a1d9db4d172a185e979a38bfd0efdb5830"
        }
      ]
    },
    {
      "id": "acidanthera-opencorepkg",
      "path": "acidanthera-opencorepkg",
      "license": "BSD-3-Clause",
      "source": {
        "name": "acidanthera/OpenCorePkg",
        "version": "3eb5eea3729bb953517d2dc6501e8ac2cabfc3d4",
        "url": "https://github.com/acidanthera/OpenCorePkg",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/acidanthera/OpenCorePkg/license?ref=3eb5eea3729bb953517d2dc6501e8ac2cabfc3d4",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/acidanthera/OpenCorePkg.git",
          "revision": "3eb5eea3729bb953517d2dc6501e8ac2cabfc3d4",
          "ref": "3eb5eea3729bb953517d2dc6501e8ac2cabfc3d4"
        }
      ]
    },
    {
      "id": "jupyterlab-jupyterlab",
      "path": "jupyterlab-jupyterlab",
      "license": "BSD-3-Clause",
      "source": {
        "name": "jupyterlab/jupyterlab",
        "version": "08b3325c4ad3a0c817e56d883612b2b167e7404c",
        "url": "https://github.com/jupyterlab/jupyterlab",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jupyterlab/jupyterlab/license?ref=08b3325c4ad3a0c817e56d883612b2b167e7404c",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "TypeScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/jupyterlab/jupyterlab.git",
          "revision": "08b3325c4ad3a0c817e56d883612b2b167e7404c",
          "ref": "08b3325c4ad3a0c817e56d883612b2b167e7404c"
        }
      ]
    },
    {
      "id": "keycastr-keycastr",
      "path": "keycastr-keycastr",
      "license": "BSD-3-Clause",
      "source": {
        "name": "keycastr/keycastr",
        "version": "58133a7bca58586b6fa1f462b4c13f09404f9c6a",
        "url": "https://github.com/keycastr/keycastr",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/keycastr/keycastr/license?ref=58133a7bca58586b6fa1f462b4c13f09404f9c6a",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Objective-C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/keycastr/keycastr.git",
          "revision": "58133a7bca58586b6fa1f462b4c13f09404f9c6a",
          "ref": "58133a7bca58586b6fa1f462b4c13f09404f9c6a"
        }
      ]
    },
    {
      "id": "puerkitobio-goquery",
      "path": "puerkitobio-goquery",
      "license": "BSD-3-Clause",
      "source": {
        "name": "PuerkitoBio/goquery",
        "version": "53a9b37ea8596a9fe2fb4bea6f5eb30d12c6bb6c",
        "url": "https://github.com/PuerkitoBio/goquery",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/PuerkitoBio/goquery/license?ref=53a9b37ea8596a9fe2fb4bea6f5eb30d12c6bb6c",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/PuerkitoBio/goquery.git",
          "revision": "53a9b37ea8596a9fe2fb4bea6f5eb30d12c6bb6c",
          "ref": "53a9b37ea8596a9fe2fb4bea6f5eb30d12c6bb6c"
        }
      ]
    },
    {
      "id": "webrtc-samples",
      "path": "webrtc-samples",
      "license": "BSD-3-Clause",
      "source": {
        "name": "webrtc/samples",
        "version": "6e2c5a117aa860d66d874f7c0df0ef9a3e2cd74e",
        "url": "https://github.com/webrtc/samples",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/webrtc/samples/license?ref=6e2c5a117aa860d66d874f7c0df0ef9a3e2cd74e",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/webrtc/samples.git",
          "revision": "6e2c5a117aa860d66d874f7c0df0ef9a3e2cd74e",
          "ref": "6e2c5a117aa860d66d874f7c0df0ef9a3e2cd74e"
        }
      ]
    },
    {
      "id": "shelljs-shelljs",
      "path": "shelljs-shelljs",
      "license": "BSD-3-Clause",
      "source": {
        "name": "shelljs/shelljs",
        "version": "f364da6625945414440bb15210f102ba5fc10ed9",
        "url": "https://github.com/shelljs/shelljs",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/shelljs/shelljs/license?ref=f364da6625945414440bb15210f102ba5fc10ed9",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/shelljs/shelljs.git",
          "revision": "f364da6625945414440bb15210f102ba5fc10ed9",
          "ref": "f364da6625945414440bb15210f102ba5fc10ed9"
        }
      ]
    },
    {
      "id": "yiisoft-yii2",
      "path": "yiisoft-yii2",
      "license": "BSD-3-Clause",
      "source": {
        "name": "yiisoft/yii2",
        "version": "66f00d18a29b520f85e8e8f1e32d1e7e7b556cac",
        "url": "https://github.com/yiisoft/yii2",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/yiisoft/yii2/license?ref=66f00d18a29b520f85e8e8f1e32d1e7e7b556cac",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "PHP"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/yiisoft/yii2.git",
          "revision": "66f00d18a29b520f85e8e8f1e32d1e7e7b556cac",
          "ref": "66f00d18a29b520f85e8e8f1e32d1e7e7b556cac"
        }
      ]
    },
    {
      "id": "memcached-memcached",
      "path": "memcached-memcached",
      "license": "BSD-3-Clause",
      "source": {
        "name": "memcached/memcached",
        "version": "2d51e364799bc9698bd4b11728ea978cea12da6e",
        "url": "https://github.com/memcached/memcached",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/memcached/memcached/license?ref=2d51e364799bc9698bd4b11728ea978cea12da6e",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/memcached/memcached.git",
          "revision": "2d51e364799bc9698bd4b11728ea978cea12da6e",
          "ref": "2d51e364799bc9698bd4b11728ea978cea12da6e"
        }
      ]
    },
    {
      "id": "app-vnext-polly",
      "path": "app-vnext-polly",
      "license": "BSD-3-Clause",
      "source": {
        "name": "App-vNext/Polly",
        "version": "3987bb8c0a876314ea0e29d200c333f0fdef5e53",
        "url": "https://github.com/App-vNext/Polly",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/App-vNext/Polly/license?ref=3987bb8c0a876314ea0e29d200c333f0fdef5e53",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C#"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/App-vNext/Polly.git",
          "revision": "3987bb8c0a876314ea0e29d200c333f0fdef5e53",
          "ref": "3987bb8c0a876314ea0e29d200c333f0fdef5e53"
        }
      ]
    },
    {
      "id": "arut-nginx-rtmp-module",
      "path": "arut-nginx-rtmp-module",
      "license": "BSD-2-Clause",
      "source": {
        "name": "arut/nginx-rtmp-module",
        "version": "6c7719d0ba32e00b563ec70bd43dad11960fa9c4",
        "url": "https://github.com/arut/nginx-rtmp-module",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/arut/nginx-rtmp-module/license?ref=6c7719d0ba32e00b563ec70bd43dad11960fa9c4",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/arut/nginx-rtmp-module.git",
          "revision": "6c7719d0ba32e00b563ec70bd43dad11960fa9c4",
          "ref": "6c7719d0ba32e00b563ec70bd43dad11960fa9c4"
        }
      ]
    },
    {
      "id": "vlucas-phpdotenv",
      "path": "vlucas-phpdotenv",
      "license": "BSD-3-Clause",
      "source": {
        "name": "vlucas/phpdotenv",
        "version": "416df702837983f8d5ff48c9c3fee4f5f57b980b",
        "url": "https://github.com/vlucas/phpdotenv",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/vlucas/phpdotenv/license?ref=416df702837983f8d5ff48c9c3fee4f5f57b980b",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "PHP"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/vlucas/phpdotenv.git",
          "revision": "416df702837983f8d5ff48c9c3fee4f5f57b980b",
          "ref": "416df702837983f8d5ff48c9c3fee4f5f57b980b"
        }
      ]
    },
    {
      "id": "cocoalumberjack-cocoalumberjack",
      "path": "cocoalumberjack-cocoalumberjack",
      "license": "BSD-3-Clause",
      "source": {
        "name": "CocoaLumberjack/CocoaLumberjack",
        "version": "91860fa9bcda881233539dcc00f40a0f61d3e6ff",
        "url": "https://github.com/CocoaLumberjack/CocoaLumberjack",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/CocoaLumberjack/CocoaLumberjack/license?ref=91860fa9bcda881233539dcc00f40a0f61d3e6ff",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Objective-C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/CocoaLumberjack/CocoaLumberjack.git",
          "revision": "91860fa9bcda881233539dcc00f40a0f61d3e6ff",
          "ref": "91860fa9bcda881233539dcc00f40a0f61d3e6ff"
        }
      ]
    },
    {
      "id": "alibaba-tengine",
      "path": "alibaba-tengine",
      "license": "BSD-2-Clause",
      "source": {
        "name": "alibaba/tengine",
        "version": "fcebbd12267b150c7e0406e8e3e5936c0b729aae",
        "url": "https://github.com/alibaba/tengine",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/alibaba/tengine/license?ref=fcebbd12267b150c7e0406e8e3e5936c0b729aae",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/alibaba/tengine.git",
          "revision": "fcebbd12267b150c7e0406e8e3e5936c0b729aae",
          "ref": "fcebbd12267b150c7e0406e8e3e5936c0b729aae"
        }
      ]
    },
    {
      "id": "expo-create-react-native-app",
      "path": "expo-create-react-native-app",
      "license": "BSD-3-Clause",
      "source": {
        "name": "expo/create-react-native-app",
        "version": "3a7b11ee859c5c38fe09be58419e97a286a22c13",
        "url": "https://github.com/expo/create-react-native-app",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/expo/create-react-native-app/license?ref=3a7b11ee859c5c38fe09be58419e97a286a22c13",
          "declaration": "BSD-3-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/expo/create-react-native-app.git",
          "revision": "3a7b11ee859c5c38fe09be58419e97a286a22c13",
          "ref": "3a7b11ee859c5c38fe09be58419e97a286a22c13"
        }
      ]
    },
    {
      "id": "gopherjs-gopherjs",
      "path": "gopherjs-gopherjs",
      "license": "BSD-2-Clause",
      "source": {
        "name": "gopherjs/gopherjs",
        "version": "490705b1d6fc7d5bd9202ac41888e146183328eb",
        "url": "https://github.com/gopherjs/gopherjs",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/gopherjs/gopherjs/license?ref=490705b1d6fc7d5bd9202ac41888e146183328eb",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Go"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/gopherjs/gopherjs.git",
          "revision": "490705b1d6fc7d5bd9202ac41888e146183328eb",
          "ref": "490705b1d6fc7d5bd9202ac41888e146183328eb"
        }
      ]
    },
    {
      "id": "node-inspector-node-inspector",
      "path": "node-inspector-node-inspector",
      "license": "BSD-2-Clause",
      "source": {
        "name": "node-inspector/node-inspector",
        "version": "79e01c049286374f86dd560742a614019c02402f",
        "url": "https://github.com/node-inspector/node-inspector",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/node-inspector/node-inspector/license?ref=79e01c049286374f86dd560742a614019c02402f",
          "declaration": "BSD-2-Clause"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "JavaScript"
          ],
          "selection": "Tracked project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Public Git repository at the pinned commit; SPDX license matched from the repository license file by the GitHub License API."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://github.com/node-inspector/node-inspector.git",
          "revision": "79e01c049286374f86dd560742a614019c02402f",
          "ref": "79e01c049286374f86dd560742a614019c02402f"
        }
      ]
    }
  ]
}
JSON
