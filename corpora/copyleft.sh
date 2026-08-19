#!/bin/sh
set -eu

script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)
. "$script_dir/../functions.sh"

fetcher_begin "$@"
fetcher_require jq find sort awk wc git tar
fetcher_size 100G
fetcher_git 'clash-verge-rev-clash-verge-rev' 'https://github.com/clash-verge-rev/clash-verge-rev.git' 'c34781e1677d29422940c57e10fbf254c5f215ff' 'c34781e1677d29422940c57e10fbf254c5f215ff' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'comfy-org-comfyui' 'https://github.com/Comfy-Org/ComfyUI.git' 'a683fa6e577f3f73ab8a0b4d7434173ccaec9c12' 'a683fa6e577f3f73ab8a0b4d7434173ccaec9c12' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git '2dust-v2rayn' 'https://github.com/2dust/v2rayN.git' '31044f449db5562aedb871daf69c0873e4b8a768' '31044f449db5562aedb871daf69c0873e4b8a768' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'netdata-netdata' 'https://github.com/netdata/netdata.git' '58d3948c3af4f15bfd1c146b40e7f419675f2dbe' '58d3948c3af4f15bfd1c146b40e7f419675f2dbe' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ventoy-ventoy' 'https://github.com/ventoy/Ventoy.git' '6568972abca37e33e031e1f2651a68a86491082b' '6568972abca37e33e031e1f2651a68a86491082b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'obsproject-obs-studio' 'https://github.com/obsproject/obs-studio.git' '220a16378fb9079b0ebd008ee994f5cb298de90d' '220a16378fb9079b0ebd008ee994f5cb298de90d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'binary-husky-gpt_academic' 'https://github.com/binary-husky/gpt_academic.git' 'd6bde0fa54373309bd05823a49bda8da019d2c77' 'd6bde0fa54373309bd05823a49bda8da019d2c77' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ansible-ansible' 'https://github.com/ansible/ansible.git' 'c5ecb46c3f8c135a76ee86584f4b77b50184e5a6' 'c5ecb46c3f8c135a76ee86584f4b77b50184e5a6' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gorhill-ublock' 'https://github.com/gorhill/uBlock.git' '6bc5ee892d7b135d1d230d658520c46ab2cbb2e8' '6bc5ee892d7b135d1d230d658520c46ab2cbb2e8' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xtekky-gpt4free' 'https://github.com/xtekky/gpt4free.git' '8b4edf83622eabe445d28df313e704c9cdd342ff' '8b4edf83622eabe445d28df313e704c9cdd342ff' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'topjohnwu-magisk' 'https://github.com/topjohnwu/Magisk.git' 'ede844bdaa4d673617c0f14a991a79542c95967c' 'ede844bdaa4d673617c0f14a991a79542c95967c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git '2dust-v2rayng' 'https://github.com/2dust/v2rayNG.git' 'f63f649477fe884ae6101ccb2c6fb172832e0d03' 'f63f649477fe884ae6101ccb2c6fb172832e0d03' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'tw93-pake' 'https://github.com/tw93/Pake.git' 'c01afad4e258de6a27fa483908dfdeb6df3914ad' 'c01afad4e258de6a27fa483908dfdeb6df3914ad' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'deepfakes-faceswap' 'https://github.com/deepfakes/faceswap.git' 'f530cb7508ae670f6474f8a7d9c4df94705cf96b' 'f530cb7508ae670f6474f8a7d9c4df94705cf96b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jellyfin-jellyfin' 'https://github.com/jellyfin/jellyfin.git' 'fb763c47bfc88b1661f8dd1f3f7a4340d140380e' 'fb763c47bfc88b1661f8dd1f3f7a4340d140380e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'werwolv-imhex' 'https://github.com/WerWolv/ImHex.git' 'bb938c41fb29aed576180384d534cf2476bc8ebb' 'bb938c41fb29aed576180384d534cf2476bc8ebb' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'freqtrade-freqtrade' 'https://github.com/freqtrade/freqtrade.git' '89d469fe638eaf116d45a8f92598aeed4d9f6dde' '89d469fe638eaf116d45a8f92598aeed4d9f6dde' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sickcodes-docker-osx' 'https://github.com/sickcodes/Docker-OSX.git' 'aa05a2c9a06aabfc8542c1c373ad1ad0af74ede3' 'aa05a2c9a06aabfc8542c1c373ad1ad0af74ede3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'justjavac-wechat-miniapp-radar' 'https://github.com/justjavac/wechat-miniapp-radar.git' '02a010ecea0320b7aa975bb62a5dde271ae630c9' '02a010ecea0320b7aa975bb62a5dde271ae630c9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'chen08209-flclash' 'https://github.com/chen08209/FlClash.git' '7c831855efedceb1a72bd0b4c18da026593d0853' '7c831855efedceb1a72bd0b4c18da026593d0853' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'acmesh-official-acme.sh' 'https://github.com/acmesh-official/acme.sh.git' '2feb392bd0e3964d9bf68871ae804578d9d5ca80' '2feb392bd0e3964d9bf68871ae804578d9d5ca80' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'iina-iina' 'https://github.com/iina/iina.git' 'a25ed1390eff00cbed5f2eca045ee8dccd28d791' 'a25ed1390eff00cbed5f2eca045ee8dccd28d791' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jgm-pandoc' 'https://github.com/jgm/pandoc.git' '87bc462713209420f9beac0041b47c42935f7a1d' '87bc462713209420f9beac0041b47c42935f7a1d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mhsanaei-3x-ui' 'https://github.com/MHSanaei/3x-ui.git' 'ece16559397f756513d7338f59168049dd6e2e51' 'ece16559397f756513d7338f59168049dd6e2e51' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'paperless-ngx-paperless-ngx' 'https://github.com/paperless-ngx/paperless-ngx.git' '17dc482872cf62e12965f6207772c83d1deb651b' '17dc482872cf62e12965f6207772c83d1deb651b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mifi-lossless-cut' 'https://github.com/mifi/lossless-cut.git' '3b9a59c288bf6e11076b583c932cfa48ddab3b02' '3b9a59c288bf6e11076b583c932cfa48ddab3b02' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git '666ghj-bettafish' 'https://github.com/666ghj/BettaFish.git' 'dcd309dfc08480708e41af0c9f7b2e68db191a25' 'dcd309dfc08480708e41af0c9f7b2e68db191a25' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'aria2-aria2' 'https://github.com/aria2/aria2.git' '9e7273583f83e881e3ec067b523ba88724088d2f' '9e7273583f83e881e3ec067b523ba88724088d2f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'chatboxai-chatbox' 'https://github.com/chatboxai/chatbox.git' '5c7e38828699aefa4efd17b44f817aa263c8f900' '5c7e38828699aefa4efd17b44f817aa263c8f900' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bailicangdu-vue2-elm' 'https://github.com/bailicangdu/vue2-elm.git' 'b85ff0220366be863868269177a4abf74c7a85ca' 'b85ff0220366be863868269177a4abf74c7a85ca' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'corentinth-it-tools' 'https://github.com/CorentinTh/it-tools.git' 'd505845f918e946ec300af7b36efc107e2f66e9e' 'd505845f918e946ec300af7b36efc107e2f66e9e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lizardbyte-sunshine' 'https://github.com/LizardByte/Sunshine.git' '25c06d79b54f3d092d3fedd5f5ba44989f394692' '25c06d79b54f3d092d3fedd5f5ba44989f394692' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'koalaman-shellcheck' 'https://github.com/koalaman/shellcheck.git' '9af7ee28ce587baadd950b85dd6826a16b9c068d' '9af7ee28ce587baadd950b85dd6826a16b9c068d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'halo-dev-halo' 'https://github.com/halo-dev/halo.git' '815292f426d8f216d02398a2813dc9a52d881775' '815292f426d8f216d02398a2813dc9a52d881775' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'teamnewpipe-newpipe' 'https://github.com/TeamNewPipe/NewPipe.git' '89d2423692918653134e79a841d96e065175e976' '89d2423692918653134e79a841d96e065175e976' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'sharex-sharex' 'https://github.com/ShareX/ShareX.git' 'b1a388ebd428e49fd9909e9319c2ce8e93577f67' 'b1a388ebd428e49fd9909e9319c2ce8e93577f67' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'huiyadanli-revokemsgpatcher' 'https://github.com/huiyadanli/RevokeMsgPatcher.git' '939dfaf00a2fcec90674c4ffddb37b6773460c51' '939dfaf00a2fcec90674c4ffddb37b6773460c51' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'frappe-erpnext' 'https://github.com/frappe/erpnext.git' '53d3ba7a7820e3c09b24a698149a63ecfc523e84' '53d3ba7a7820e3c09b24a698149a63ecfc523e84' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'pbatard-rufus' 'https://github.com/pbatard/rufus.git' '6d8fbf98305ff37eb531c45cbd6ff44563c53917' '6d8fbf98305ff37eb531c45cbd6ff44563c53917' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git '1panel-dev-1panel' 'https://github.com/1Panel-dev/1Panel.git' 'd1558c5eaea9bcafef5f3a885af279ad5ccd8d25' 'd1558c5eaea9bcafef5f3a885af279ad5ccd8d25' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'zuodaotech-everyone-can-use-english' 'https://github.com/ZuodaoTech/everyone-can-use-english.git' '3d799132046993eade5a364ddd1e557906854eda' '3d799132046993eade5a364ddd1e557906854eda' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'alvarotrigo-fullpage.js' 'https://github.com/alvarotrigo/fullPage.js.git' '49f15effa7b195def295a36f872c28153cf9fb00' '49f15effa7b195def295a36f872c28153cf9fb00' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'kovidgoyal-kitty' 'https://github.com/kovidgoyal/kitty.git' 'a6d5e7145a3fc36822bcf5296e4b1f1194239f48' 'a6d5e7145a3fc36822bcf5296e4b1f1194239f48' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ehang-io-nps' 'https://github.com/ehang-io/nps.git' 'ab648d6f0c618c690a7a79948a7ebd686e1cdafc' 'ab648d6f0c618c690a7a79948a7ebd686e1cdafc' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'valinet-explorerpatcher' 'https://github.com/valinet/ExplorerPatcher.git' '0a88a6e0ef6b1752fea36e581cffff1097e862b0' '0a88a6e0ef6b1752fea36e581cffff1097e862b0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bilibili-ijkplayer' 'https://github.com/bilibili/ijkplayer.git' '30eb9441945da795079492041a791c121d2b8206' '30eb9441945da795079492041a791c121d2b8206' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'shadowsocks-shadowsocksx-ng' 'https://github.com/shadowsocks/ShadowsocksX-NG.git' '719203afc60e1dbab00e459ebcfecc468e7700bd' '719203afc60e1dbab00e459ebcfecc468e7700bd' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'shadps4-emu-shadps4' 'https://github.com/shadps4-emu/shadPS4.git' 'c5ae3c681276bd884b9b714c2099d55796c36154' 'c5ae3c681276bd884b9b714c2099d55796c36154' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'facebook-rocksdb' 'https://github.com/facebook/rocksdb.git' '1dfa7297933df05237ac11376d6cb69d32591b1d' '1dfa7297933df05237ac11376d6cb69d32591b1d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gethomepage-homepage' 'https://github.com/gethomepage/homepage.git' '1a047d1dfc135fd3c904699f562dd9ea892088e6' '1a047d1dfc135fd3c904699f562dd9ea892088e6' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jumpserver-jumpserver' 'https://github.com/jumpserver/jumpserver.git' '93214a3067ad80b04d036122eeab33f2539e3633' '93214a3067ad80b04d036122eeab33f2539e3633' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'flameshot-org-flameshot' 'https://github.com/flameshot-org/flameshot.git' '52260408e3a3b810095d8e7661ca2911cb46ea57' '52260408e3a3b810095d8e7661ca2911cb46ea57' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'maboloshi-github-chinese' 'https://github.com/maboloshi/github-chinese.git' 'bf852c09a2ee1e4d832af62d50e4f839ad3514e1' 'bf852c09a2ee1e4d832af62d50e4f839ad3514e1' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xuxueli-xxl-job' 'https://github.com/xuxueli/xxl-job.git' 'e74c784f68f81fa89cb350913ef15794865d7b12' 'e74c784f68f81fa89cb350913ef15794865d7b12' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'drklo-telegram' 'https://github.com/DrKLO/Telegram.git' '45ab8f4308496e1f01026a97fcdb0d58a5274474' '45ab8f4308496e1f01026a97fcdb0d58a5274474' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git '233boy-v2ray' 'https://github.com/233boy/v2ray.git' '707ecf7601ff49f91c2d12dd22b98e8f89588d1c' '707ecf7601ff49f91c2d12dd22b98e8f89588d1c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'python-telegram-bot-python-telegram-bot' 'https://github.com/python-telegram-bot/python-telegram-bot.git' '377f5effb3afc2d9b1e7e1de1b908b26cc87fd17' '377f5effb3afc2d9b1e7e1de1b908b26cc87fd17' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'slymnoyann-hey-1' 'https://github.com/slymnoyann/hey-1.git' '88c8f9d55340d57a37846ff72f55c2c604e3a566' '88c8f9d55340d57a37846ff72f55c2c604e3a566' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'librepods-org-librepods' 'https://github.com/librepods-org/librepods.git' 'b5a3eaee8fbe5a0c83c360bb0fdcd6705a59cc25' 'b5a3eaee8fbe5a0c83c360bb0fdcd6705a59cc25' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jordanbaird-ice' 'https://github.com/jordanbaird/Ice.git' '11edd39115f3f43a83ae114b5348df6a0e1741cf' '11edd39115f3f43a83ae114b5348df6a0e1741cf' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'revanced-revanced-manager' 'https://github.com/ReVanced/revanced-manager.git' '2a88257b71d35c9f141907ffea67c87e51bbb0db' '2a88257b71d35c9f141907ffea67c87e51bbb0db' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'predidit-kazumi' 'https://github.com/Predidit/Kazumi.git' 'c5e3feb43bcdb576d9639649991ebad77c1ab31f' 'c5e3feb43bcdb576d9639649991ebad77c1ab31f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'anuken-mindustry' 'https://github.com/Anuken/Mindustry.git' '269a3f58415cda92af1b55038924f5865bc17a0e' '269a3f58415cda92af1b55038924f5865bc17a0e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'cloudreve-cloudreve' 'https://github.com/cloudreve/cloudreve.git' '20c95ad73f3a8bcb72887fea91ff31ab24fa1011' '20c95ad73f3a8bcb72887fea91ff31ab24fa1011' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'nvchad-nvchad' 'https://github.com/NvChad/NvChad.git' 'add44b952d631981614bbb8cfc6f7002f296dfe6' 'add44b952d631981614bbb8cfc6f7002f296dfe6' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'fanmingming-live' 'https://github.com/fanmingming/live.git' 'b085d39e05d126f91709d7a545604bd667a6f026' 'b085d39e05d126f91709d7a545604bd667a6f026' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'junkfood02-seal' 'https://github.com/JunkFood02/Seal.git' '44e0d2e6fc26177e0da4cb1948223baa13b0887f' '44e0d2e6fc26177e0da4cb1948223baa13b0887f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'deskflow-deskflow' 'https://github.com/deskflow/deskflow.git' 'f765e829f2373f055331e910d69b8c8b8006952b' 'f765e829f2373f055331e910d69b8c8b8006952b' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'wox-launcher-wox' 'https://github.com/Wox-launcher/Wox.git' '2e1db9c38a7bb03ecbd67cec4c47bf39c3633880' '2e1db9c38a7bb03ecbd67cec4c47bf39c3633880' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'niri-wm-niri' 'https://github.com/niri-wm/niri.git' '59a10015610bb7d068a82ce1c386fcd8b44f6c52' '59a10015610bb7d068a82ce1c386fcd8b44f6c52' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'schniz-fnm' 'https://github.com/Schniz/fnm.git' '86adc9676ceb2a509b21e75e74048b93c89f097d' '86adc9676ceb2a509b21e75e74048b93c89f097d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'beyonddimension-steamtools' 'https://github.com/BeyondDimension/SteamTools.git' 'c16ffa08e03b192d23ada290c4969e77f9201f3d' 'c16ffa08e03b192d23ada290c4969e77f9201f3d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'typesense-typesense' 'https://github.com/typesense/typesense.git' '2b1ea8002cfa6febc212123deec6c6bed66837b3' '2b1ea8002cfa6febc212123deec6c6bed66837b3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ycm-core-youcompleteme' 'https://github.com/ycm-core/YouCompleteMe.git' 'd4c91430b70a21ce471c8572400b647d313995b4' 'd4c91430b70a21ce471c8572400b647d313995b4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mihomo-party-org-clash-party' 'https://github.com/mihomo-party-org/clash-party.git' '8af583e771b218d33174e3897ac7b5bdec1cb302' '8af583e771b218d33174e3897ac7b5bdec1cb302' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'zhaoolee-chromeappheroes' 'https://github.com/zhaoolee/ChromeAppHeroes.git' 'abe715d5059c415225e2a1e42ecf67d0aa65b5a1' 'abe715d5059c415225e2a1e42ecf67d0aa65b5a1' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gopeedlab-gopeed' 'https://github.com/GopeedLab/gopeed.git' 'fdfc6902a7750a3628735e8bf37d739bfda9549c' 'fdfc6902a7750a3628735e8bf37d739bfda9549c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'argotorg-solidity' 'https://github.com/argotorg/solidity.git' '9b2f86bebbbc22c7c9f5ca41884d47fcc1d0639a' '9b2f86bebbbc22c7c9f5ca41884d47fcc1d0639a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'syl20bnr-spacemacs' 'https://github.com/syl20bnr/spacemacs.git' '47c09c5777a33ecd59ea0456829041464883135a' '47c09c5777a33ecd59ea0456829041464883135a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'ql-win-quicklook' 'https://github.com/QL-Win/QuickLook.git' 'cb5d9c429c81d9796fac469da2a68efb5626946d' 'cb5d9c429c81d9796fac469da2a68efb5626946d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lsposed-lsposed' 'https://github.com/LSPosed/LSPosed.git' 'df74d83eb03a44cc6ad268841ac2ada28d077c77' 'df74d83eb03a44cc6ad268841ac2ada28d077c77' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'dataease-dataease' 'https://github.com/dataease/dataease.git' '9f37143899b47c570a1d3769368641db1a2f5a5c' '9f37143899b47c570a1d3769368641db1a2f5a5c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'air-verse-air' 'https://github.com/air-verse/air.git' '9f19e52511f7bb697036e6ee2c12a212e742199d' '9f19e52511f7bb697036e6ee2c12a212e742199d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'aldanial-cloc' 'https://github.com/AlDanial/cloc.git' 'e94e6ec247b7a30290024d546d0fc86f3ce89261' 'e94e6ec247b7a30290024d546d0fc86f3ce89261' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'openjdk-jdk' 'https://github.com/openjdk/jdk.git' '20ccb7cfbde76b7ce2bb0e635934c252a187f702' '20ccb7cfbde76b7ce2bb0e635934c252a187f702' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'navidrome-navidrome' 'https://github.com/navidrome/navidrome.git' 'a0bf78cdeab4d0f316edcd37094f03d09f0ede8e' 'a0bf78cdeab4d0f316edcd37094f03d09f0ede8e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mementum-backtrader' 'https://github.com/mementum/backtrader.git' 'b853d7c90b6721476eb5a5ea3135224e33db1f14' 'b853d7c90b6721476eb5a5ea3135224e33db1f14' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'feliscatus-switchyomega' 'https://github.com/FelisCatus/SwitchyOmega.git' '19f9d73f20125b6164fb95d17cd4cc6659df147c' '19f9d73f20125b6164fb95d17cd4cc6659df147c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git '1panel-dev-maxkb' 'https://github.com/1Panel-dev/MaxKB.git' '01b21db88145278d98bf5e9bd55e6abd6b3aad43' '01b21db88145278d98bf5e9bd55e6abd6b3aad43' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'chaitin-safeline' 'https://github.com/chaitin/SafeLine.git' '2f27406501973da4bf8543bc9623beb624330215' '2f27406501973da4bf8543bc9623beb624330215' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'darkflippers-unleashed-firmware' 'https://github.com/DarkFlippers/unleashed-firmware.git' '9d4dae48fad0aaebaf87254cd0707ed6fff073de' '9d4dae48fad0aaebaf87254cd0707ed6fff073de' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'qmk-qmk_firmware' 'https://github.com/qmk/qmk_firmware.git' '9caa5f871ddb9813c7370708be62d7a3e1cfeb75' '9caa5f871ddb9813c7370708be62d7a3e1cfeb75' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'atmosphere-nx-atmosphere' 'https://github.com/Atmosphere-NX/Atmosphere.git' 'e468f59c9d369b8ebbffa040f4c9fc201b9f75a8' 'e468f59c9d369b8ebbffa040f4c9fc201b9f75a8' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'rpcs3-rpcs3' 'https://github.com/RPCS3/rpcs3.git' '8d034a36e8119165a581c0f7c6c76c5f156886e3' '8d034a36e8119165a581c0f7c6c76c5f156886e3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'videolan-vlc' 'https://github.com/videolan/vlc.git' '329ed3135eeabd85d2f190b8e3388e7a7e441d0f' '329ed3135eeabd85d2f190b8e3388e7a7e441d0f' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'kyleneideck-backgroundmusic' 'https://github.com/kyleneideck/BackgroundMusic.git' '8c25450e9b0d3867417c4872018b03fb30c0c85c' '8c25450e9b0d3867417c4872018b03fb30c0c85c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mikf-gallery-dl' 'https://github.com/mikf/gallery-dl.git' '86047cf67a12bdb6ff1085774f8ad9fc347e8da9' '86047cf67a12bdb6ff1085774f8ad9fc347e8da9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'copytranslator-copytranslator' 'https://github.com/CopyTranslator/CopyTranslator.git' '5b73e4262625cdcd0b4621d0e6d5f59ed08de4ef' '5b73e4262625cdcd0b4621d0e6d5f59ed08de4ef' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnachman-iterm2' 'https://github.com/gnachman/iTerm2.git' '3ec57866cd9bcf932f2675f7ca47183793a37b79' '3ec57866cd9bcf932f2675f7ca47183793a37b79' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'reactos-reactos' 'https://github.com/reactos/reactos.git' 'a318b6228a24cda9b752501470e61550e925f657' 'a318b6228a24cda9b752501470e61550e925f657' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'systemd-systemd' 'https://github.com/systemd/systemd.git' '06cb8fbe618604f43c9a9a638e6fc3df920daa0c' '06cb8fbe618604f43c9a9a638e6fc3df920daa0c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xournalpp-xournalpp' 'https://github.com/xournalpp/xournalpp.git' '89bc8dbb45277ff18e888711c4e5b824400a13b4' '89bc8dbb45277ff18e888711c4e5b824400a13b4' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'xcanwin-keepchatgpt' 'https://github.com/xcanwin/KeepChatGPT.git' 'bdc253cb96bdf7f4741d9bf87c4c6532967ffdb3' 'bdc253cb96bdf7f4741d9bf87c4c6532967ffdb3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bailicangdu-vue2-manage' 'https://github.com/bailicangdu/vue2-manage.git' 'dca263e3a8411ec47b5814a01470162d907d6964' 'dca263e3a8411ec47b5814a01470162d907d6964' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'jonas-tig' 'https://github.com/jonas/tig.git' '1b86f070a1f6d4c686a09b997fd4249d52a2a272' '1b86f070a1f6d4c686a09b997fd4249d52a2a272' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'autohotkey-autohotkey' 'https://github.com/AutoHotkey/AutoHotkey.git' '34b170115414dd69f1dfaf54893c150deade6bd2' '34b170115414dd69f1dfaf54893c150deade6bd2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'stremio-stremio-web' 'https://github.com/Stremio/stremio-web.git' 'de0e1cdff7ab34c31a5e33fca19ad8de0ebba6e9' 'de0e1cdff7ab34c31a5e33fca19ad8de0ebba6e9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'automattic-wp-calypso' 'https://github.com/Automattic/wp-calypso.git' '329b3647ba759c0a8f3e5034aee5e83c861cab54' '329b3647ba759c0a8f3e5034aee5e83c861cab54' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'secdev-scapy' 'https://github.com/secdev/scapy.git' 'd8f7b272b1eb3e989920ba2a84bbae1a847660bd' 'd8f7b272b1eb3e989920ba2a84bbae1a847660bd' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'typecho-typecho' 'https://github.com/typecho/typecho.git' '56f4c6f33955a87969c399b5d5912d7f9fd7347c' '56f4c6f33955a87969c399b5d5912d7f9fd7347c' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'bailicangdu-node-elm' 'https://github.com/bailicangdu/node-elm.git' '32ea999c63f59db4f6fb05e3227bc305663782f0' '32ea999c63f59db4f6fb05e3227bc305663782f0' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'daybreak-u-chineseocr_lite' 'https://github.com/DayBreak-u/chineseocr_lite.git' '54a3df53af823f3bffdde9393d0c021b4f6d94cd' '54a3df53af823f3bffdde9393d0c021b4f6d94cd' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lostindark-driverstoreexplorer' 'https://github.com/lostindark/DriverStoreExplorer.git' 'd983831f2838b2871255cd5e915dd1a5c07bb6c9' 'd983831f2838b2871255cd5e915dd1a5c07bb6c9' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'mremoteng-mremoteng' 'https://github.com/mRemoteNG/mRemoteNG.git' '87ebe87ad735f9bfd0578e2d4d3e4c71ec1ad007' '87ebe87ad735f9bfd0578e2d4d3e4c71ec1ad007' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'aboul3la-sublist3r' 'https://github.com/aboul3la/Sublist3r.git' '729d649ec5370730172bf6f5314aafd68c874124' '729d649ec5370730172bf6f5314aafd68c874124' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'trinitycore-trinitycore' 'https://github.com/TrinityCore/TrinityCore.git' 'fcf3b8ec1c9bb4a20b491454df79d29c3ae4c165' 'fcf3b8ec1c9bb4a20b491454df79d29c3ae4c165' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'rofl0r-proxychains-ng' 'https://github.com/rofl0r/proxychains-ng.git' 'e6313ce408645b70b60881130fb2dae9c538b306' 'e6313ce408645b70b60881130fb2dae9c538b306' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'taojy123-keymousego' 'https://github.com/taojy123/KeymouseGo.git' '49577ed0877a0739eef84b2d09f95fca1bbbb416' '49577ed0877a0739eef84b2d09f95fca1bbbb416' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'lmms-lmms' 'https://github.com/LMMS/lmms.git' '067c3ad4124af9114d8aa186923550e51e1b8e5a' '067c3ad4124af9114d8aa186923550e51e1b8e5a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 's3fs-fuse-s3fs-fuse' 'https://github.com/s3fs-fuse/s3fs-fuse.git' 'c12124a4e1194375511efb35c04d473b26b7f853' 'c12124a4e1194375511efb35c04d473b26b7f853' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-bash' 'https://git.savannah.gnu.org/git/bash.git' 'b460816602167718f78a6233164e8875f49b75b2' 'b460816602167718f78a6233164e8875f49b75b2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-coreutils' 'https://git.savannah.gnu.org/git/coreutils.git' '786488adef22c477d8e3c8b562f9c4cb02288014' '786488adef22c477d8e3c8b562f9c4cb02288014' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-diffutils' 'https://git.savannah.gnu.org/git/diffutils.git' 'ba490bf17c1938e7cd0c2309a08d9a59b962bdff' 'ba490bf17c1938e7cd0c2309a08d9a59b962bdff' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-emacs' 'https://git.savannah.gnu.org/git/emacs.git' 'b157d8e96a26e7509136bf93fad2c7ec49c0ee88' 'b157d8e96a26e7509136bf93fad2c7ec49c0ee88' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-findutils' 'https://git.savannah.gnu.org/git/findutils.git' 'eaa3ba5a63b569dbf1a4b1389963f734ebe7edd3' 'eaa3ba5a63b569dbf1a4b1389963f734ebe7edd3' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-gawk' 'https://git.savannah.gnu.org/git/gawk.git' '65929a5cdba54e1e044c91218b0dd845bf50455a' '65929a5cdba54e1e044c91218b0dd845bf50455a' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-grep' 'https://git.savannah.gnu.org/git/grep.git' '79da8e07613966b9e53c7ef31b4765d39f98044d' '79da8e07613966b9e53c7ef31b4765d39f98044d' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-gzip' 'https://git.savannah.gnu.org/git/gzip.git' '5f62db44b781b01a3d6d8436babcf8113f32efd2' '5f62db44b781b01a3d6d8436babcf8113f32efd2' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-make' 'https://git.savannah.gnu.org/git/make.git' 'b3802782de3eff2c0f1eda9e7c0befd8cd142162' 'b3802782de3eff2c0f1eda9e7c0befd8cd142162' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-nano' 'https://git.savannah.gnu.org/git/nano.git' '8e6360d1663998c62ddd0cf934923d1f18004e3e' '8e6360d1663998c62ddd0cf934923d1f18004e3e' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-patch' 'https://git.savannah.gnu.org/git/patch.git' 'a2b192295d7046bafc18d54973436bb3faa659d7' 'a2b192295d7046bafc18d54973436bb3faa659d7' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-sed' 'https://git.savannah.gnu.org/git/sed.git' '31df9f71cb62e423311985b3bf352ee84c4a9e54' '31df9f71cb62e423311985b3bf352ee84c4a9e54' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-tar' 'https://git.savannah.gnu.org/git/tar.git' 'd1df7f403de05bfbe11527a5b570469fb1011fda' 'd1df7f403de05bfbe11527a5b570469fb1011fda' '--skip-symlinks' '--filter-blobs' '--source-code'
fetcher_git 'gnu-wget' 'https://git.savannah.gnu.org/git/wget.git' '705e9e3a749f9f0430c1fad9892227c210c66dee' '705e9e3a749f9f0430c1fad9892227c210c66dee' '--skip-symlinks' '--filter-blobs' '--source-code'

# shellcheck disable=SC2119
fetcher_manifest <<'JSON'
{
  "corpus": {
    "id": "copyleft",
    "title": "Copyleft-Licensed Project Code",
    "description": "Project-owned files from immutable open-source repository commits, with text, structured, and binary assets retained while common vendored, generated, dependency, fixture, and build-output trees are excluded.",
    "destination": "code/copyleft"
  },
  "sources": [
    {
      "id": "clash-verge-rev-clash-verge-rev",
      "path": "clash-verge-rev-clash-verge-rev",
      "license": "GPL-3.0-only",
      "source": {
        "name": "clash-verge-rev/clash-verge-rev",
        "version": "c34781e1677d29422940c57e10fbf254c5f215ff",
        "url": "https://github.com/clash-verge-rev/clash-verge-rev",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/clash-verge-rev/clash-verge-rev/license?ref=c34781e1677d29422940c57e10fbf254c5f215ff",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/clash-verge-rev/clash-verge-rev.git",
          "revision": "c34781e1677d29422940c57e10fbf254c5f215ff",
          "ref": "c34781e1677d29422940c57e10fbf254c5f215ff"
        }
      ]
    },
    {
      "id": "comfy-org-comfyui",
      "path": "comfy-org-comfyui",
      "license": "GPL-3.0-only",
      "source": {
        "name": "Comfy-Org/ComfyUI",
        "version": "a683fa6e577f3f73ab8a0b4d7434173ccaec9c12",
        "url": "https://github.com/Comfy-Org/ComfyUI",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Comfy-Org/ComfyUI/license?ref=a683fa6e577f3f73ab8a0b4d7434173ccaec9c12",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/Comfy-Org/ComfyUI.git",
          "revision": "a683fa6e577f3f73ab8a0b4d7434173ccaec9c12",
          "ref": "a683fa6e577f3f73ab8a0b4d7434173ccaec9c12"
        }
      ]
    },
    {
      "id": "2dust-v2rayn",
      "path": "2dust-v2rayn",
      "license": "GPL-3.0-only",
      "source": {
        "name": "2dust/v2rayN",
        "version": "31044f449db5562aedb871daf69c0873e4b8a768",
        "url": "https://github.com/2dust/v2rayN",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/2dust/v2rayN/license?ref=31044f449db5562aedb871daf69c0873e4b8a768",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/2dust/v2rayN.git",
          "revision": "31044f449db5562aedb871daf69c0873e4b8a768",
          "ref": "31044f449db5562aedb871daf69c0873e4b8a768"
        }
      ]
    },
    {
      "id": "netdata-netdata",
      "path": "netdata-netdata",
      "license": "GPL-3.0-only",
      "source": {
        "name": "netdata/netdata",
        "version": "58d3948c3af4f15bfd1c146b40e7f419675f2dbe",
        "url": "https://github.com/netdata/netdata",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/netdata/netdata/license?ref=58d3948c3af4f15bfd1c146b40e7f419675f2dbe",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/netdata/netdata.git",
          "revision": "58d3948c3af4f15bfd1c146b40e7f419675f2dbe",
          "ref": "58d3948c3af4f15bfd1c146b40e7f419675f2dbe"
        }
      ]
    },
    {
      "id": "ventoy-ventoy",
      "path": "ventoy-ventoy",
      "license": "GPL-3.0-only",
      "source": {
        "name": "ventoy/Ventoy",
        "version": "6568972abca37e33e031e1f2651a68a86491082b",
        "url": "https://github.com/ventoy/Ventoy",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ventoy/Ventoy/license?ref=6568972abca37e33e031e1f2651a68a86491082b",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/ventoy/Ventoy.git",
          "revision": "6568972abca37e33e031e1f2651a68a86491082b",
          "ref": "6568972abca37e33e031e1f2651a68a86491082b"
        }
      ]
    },
    {
      "id": "obsproject-obs-studio",
      "path": "obsproject-obs-studio",
      "license": "GPL-2.0-only",
      "source": {
        "name": "obsproject/obs-studio",
        "version": "220a16378fb9079b0ebd008ee994f5cb298de90d",
        "url": "https://github.com/obsproject/obs-studio",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/obsproject/obs-studio/license?ref=220a16378fb9079b0ebd008ee994f5cb298de90d",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/obsproject/obs-studio.git",
          "revision": "220a16378fb9079b0ebd008ee994f5cb298de90d",
          "ref": "220a16378fb9079b0ebd008ee994f5cb298de90d"
        }
      ]
    },
    {
      "id": "binary-husky-gpt_academic",
      "path": "binary-husky-gpt_academic",
      "license": "GPL-3.0-only",
      "source": {
        "name": "binary-husky/gpt_academic",
        "version": "d6bde0fa54373309bd05823a49bda8da019d2c77",
        "url": "https://github.com/binary-husky/gpt_academic",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/binary-husky/gpt_academic/license?ref=d6bde0fa54373309bd05823a49bda8da019d2c77",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/binary-husky/gpt_academic.git",
          "revision": "d6bde0fa54373309bd05823a49bda8da019d2c77",
          "ref": "d6bde0fa54373309bd05823a49bda8da019d2c77"
        }
      ]
    },
    {
      "id": "ansible-ansible",
      "path": "ansible-ansible",
      "license": "GPL-3.0-only",
      "source": {
        "name": "ansible/ansible",
        "version": "c5ecb46c3f8c135a76ee86584f4b77b50184e5a6",
        "url": "https://github.com/ansible/ansible",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ansible/ansible/license?ref=c5ecb46c3f8c135a76ee86584f4b77b50184e5a6",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/ansible/ansible.git",
          "revision": "c5ecb46c3f8c135a76ee86584f4b77b50184e5a6",
          "ref": "c5ecb46c3f8c135a76ee86584f4b77b50184e5a6"
        }
      ]
    },
    {
      "id": "gorhill-ublock",
      "path": "gorhill-ublock",
      "license": "GPL-3.0-only",
      "source": {
        "name": "gorhill/uBlock",
        "version": "6bc5ee892d7b135d1d230d658520c46ab2cbb2e8",
        "url": "https://github.com/gorhill/uBlock",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/gorhill/uBlock/license?ref=6bc5ee892d7b135d1d230d658520c46ab2cbb2e8",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/gorhill/uBlock.git",
          "revision": "6bc5ee892d7b135d1d230d658520c46ab2cbb2e8",
          "ref": "6bc5ee892d7b135d1d230d658520c46ab2cbb2e8"
        }
      ]
    },
    {
      "id": "xtekky-gpt4free",
      "path": "xtekky-gpt4free",
      "license": "GPL-3.0-only",
      "source": {
        "name": "xtekky/gpt4free",
        "version": "8b4edf83622eabe445d28df313e704c9cdd342ff",
        "url": "https://github.com/xtekky/gpt4free",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/xtekky/gpt4free/license?ref=8b4edf83622eabe445d28df313e704c9cdd342ff",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/xtekky/gpt4free.git",
          "revision": "8b4edf83622eabe445d28df313e704c9cdd342ff",
          "ref": "8b4edf83622eabe445d28df313e704c9cdd342ff"
        }
      ]
    },
    {
      "id": "topjohnwu-magisk",
      "path": "topjohnwu-magisk",
      "license": "GPL-3.0-only",
      "source": {
        "name": "topjohnwu/Magisk",
        "version": "ede844bdaa4d673617c0f14a991a79542c95967c",
        "url": "https://github.com/topjohnwu/Magisk",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/topjohnwu/Magisk/license?ref=ede844bdaa4d673617c0f14a991a79542c95967c",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/topjohnwu/Magisk.git",
          "revision": "ede844bdaa4d673617c0f14a991a79542c95967c",
          "ref": "ede844bdaa4d673617c0f14a991a79542c95967c"
        }
      ]
    },
    {
      "id": "2dust-v2rayng",
      "path": "2dust-v2rayng",
      "license": "GPL-3.0-only",
      "source": {
        "name": "2dust/v2rayNG",
        "version": "f63f649477fe884ae6101ccb2c6fb172832e0d03",
        "url": "https://github.com/2dust/v2rayNG",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/2dust/v2rayNG/license?ref=f63f649477fe884ae6101ccb2c6fb172832e0d03",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/2dust/v2rayNG.git",
          "revision": "f63f649477fe884ae6101ccb2c6fb172832e0d03",
          "ref": "f63f649477fe884ae6101ccb2c6fb172832e0d03"
        }
      ]
    },
    {
      "id": "tw93-pake",
      "path": "tw93-pake",
      "license": "GPL-3.0-only",
      "source": {
        "name": "tw93/Pake",
        "version": "c01afad4e258de6a27fa483908dfdeb6df3914ad",
        "url": "https://github.com/tw93/Pake",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/tw93/Pake/license?ref=c01afad4e258de6a27fa483908dfdeb6df3914ad",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/tw93/Pake.git",
          "revision": "c01afad4e258de6a27fa483908dfdeb6df3914ad",
          "ref": "c01afad4e258de6a27fa483908dfdeb6df3914ad"
        }
      ]
    },
    {
      "id": "deepfakes-faceswap",
      "path": "deepfakes-faceswap",
      "license": "GPL-3.0-only",
      "source": {
        "name": "deepfakes/faceswap",
        "version": "f530cb7508ae670f6474f8a7d9c4df94705cf96b",
        "url": "https://github.com/deepfakes/faceswap",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/deepfakes/faceswap/license?ref=f530cb7508ae670f6474f8a7d9c4df94705cf96b",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/deepfakes/faceswap.git",
          "revision": "f530cb7508ae670f6474f8a7d9c4df94705cf96b",
          "ref": "f530cb7508ae670f6474f8a7d9c4df94705cf96b"
        }
      ]
    },
    {
      "id": "jellyfin-jellyfin",
      "path": "jellyfin-jellyfin",
      "license": "GPL-2.0-only",
      "source": {
        "name": "jellyfin/jellyfin",
        "version": "fb763c47bfc88b1661f8dd1f3f7a4340d140380e",
        "url": "https://github.com/jellyfin/jellyfin",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jellyfin/jellyfin/license?ref=fb763c47bfc88b1661f8dd1f3f7a4340d140380e",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/jellyfin/jellyfin.git",
          "revision": "fb763c47bfc88b1661f8dd1f3f7a4340d140380e",
          "ref": "fb763c47bfc88b1661f8dd1f3f7a4340d140380e"
        }
      ]
    },
    {
      "id": "werwolv-imhex",
      "path": "werwolv-imhex",
      "license": "GPL-2.0-only",
      "source": {
        "name": "WerWolv/ImHex",
        "version": "bb938c41fb29aed576180384d534cf2476bc8ebb",
        "url": "https://github.com/WerWolv/ImHex",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/WerWolv/ImHex/license?ref=bb938c41fb29aed576180384d534cf2476bc8ebb",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/WerWolv/ImHex.git",
          "revision": "bb938c41fb29aed576180384d534cf2476bc8ebb",
          "ref": "bb938c41fb29aed576180384d534cf2476bc8ebb"
        }
      ]
    },
    {
      "id": "freqtrade-freqtrade",
      "path": "freqtrade-freqtrade",
      "license": "GPL-3.0-only",
      "source": {
        "name": "freqtrade/freqtrade",
        "version": "89d469fe638eaf116d45a8f92598aeed4d9f6dde",
        "url": "https://github.com/freqtrade/freqtrade",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/freqtrade/freqtrade/license?ref=89d469fe638eaf116d45a8f92598aeed4d9f6dde",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/freqtrade/freqtrade.git",
          "revision": "89d469fe638eaf116d45a8f92598aeed4d9f6dde",
          "ref": "89d469fe638eaf116d45a8f92598aeed4d9f6dde"
        }
      ]
    },
    {
      "id": "sickcodes-docker-osx",
      "path": "sickcodes-docker-osx",
      "license": "GPL-3.0-only",
      "source": {
        "name": "sickcodes/Docker-OSX",
        "version": "aa05a2c9a06aabfc8542c1c373ad1ad0af74ede3",
        "url": "https://github.com/sickcodes/Docker-OSX",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/sickcodes/Docker-OSX/license?ref=aa05a2c9a06aabfc8542c1c373ad1ad0af74ede3",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/sickcodes/Docker-OSX.git",
          "revision": "aa05a2c9a06aabfc8542c1c373ad1ad0af74ede3",
          "ref": "aa05a2c9a06aabfc8542c1c373ad1ad0af74ede3"
        }
      ]
    },
    {
      "id": "justjavac-wechat-miniapp-radar",
      "path": "justjavac-wechat-miniapp-radar",
      "license": "GPL-3.0-only",
      "source": {
        "name": "justjavac/wechat-miniapp-radar",
        "version": "02a010ecea0320b7aa975bb62a5dde271ae630c9",
        "url": "https://github.com/justjavac/wechat-miniapp-radar",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/justjavac/wechat-miniapp-radar/license?ref=02a010ecea0320b7aa975bb62a5dde271ae630c9",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/justjavac/wechat-miniapp-radar.git",
          "revision": "02a010ecea0320b7aa975bb62a5dde271ae630c9",
          "ref": "02a010ecea0320b7aa975bb62a5dde271ae630c9"
        }
      ]
    },
    {
      "id": "chen08209-flclash",
      "path": "chen08209-flclash",
      "license": "GPL-3.0-only",
      "source": {
        "name": "chen08209/FlClash",
        "version": "7c831855efedceb1a72bd0b4c18da026593d0853",
        "url": "https://github.com/chen08209/FlClash",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/chen08209/FlClash/license?ref=7c831855efedceb1a72bd0b4c18da026593d0853",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/chen08209/FlClash.git",
          "revision": "7c831855efedceb1a72bd0b4c18da026593d0853",
          "ref": "7c831855efedceb1a72bd0b4c18da026593d0853"
        }
      ]
    },
    {
      "id": "acmesh-official-acme.sh",
      "path": "acmesh-official-acme.sh",
      "license": "GPL-3.0-only",
      "source": {
        "name": "acmesh-official/acme.sh",
        "version": "2feb392bd0e3964d9bf68871ae804578d9d5ca80",
        "url": "https://github.com/acmesh-official/acme.sh",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/acmesh-official/acme.sh/license?ref=2feb392bd0e3964d9bf68871ae804578d9d5ca80",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/acmesh-official/acme.sh.git",
          "revision": "2feb392bd0e3964d9bf68871ae804578d9d5ca80",
          "ref": "2feb392bd0e3964d9bf68871ae804578d9d5ca80"
        }
      ]
    },
    {
      "id": "iina-iina",
      "path": "iina-iina",
      "license": "GPL-3.0-only",
      "source": {
        "name": "iina/iina",
        "version": "a25ed1390eff00cbed5f2eca045ee8dccd28d791",
        "url": "https://github.com/iina/iina",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/iina/iina/license?ref=a25ed1390eff00cbed5f2eca045ee8dccd28d791",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/iina/iina.git",
          "revision": "a25ed1390eff00cbed5f2eca045ee8dccd28d791",
          "ref": "a25ed1390eff00cbed5f2eca045ee8dccd28d791"
        }
      ]
    },
    {
      "id": "jgm-pandoc",
      "path": "jgm-pandoc",
      "license": "GPL-2.0-only",
      "source": {
        "name": "jgm/pandoc",
        "version": "87bc462713209420f9beac0041b47c42935f7a1d",
        "url": "https://github.com/jgm/pandoc",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jgm/pandoc/license?ref=87bc462713209420f9beac0041b47c42935f7a1d",
          "declaration": "GPL-2.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Haskell"
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
          "url": "https://github.com/jgm/pandoc.git",
          "revision": "87bc462713209420f9beac0041b47c42935f7a1d",
          "ref": "87bc462713209420f9beac0041b47c42935f7a1d"
        }
      ]
    },
    {
      "id": "mhsanaei-3x-ui",
      "path": "mhsanaei-3x-ui",
      "license": "GPL-3.0-only",
      "source": {
        "name": "MHSanaei/3x-ui",
        "version": "ece16559397f756513d7338f59168049dd6e2e51",
        "url": "https://github.com/MHSanaei/3x-ui",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/MHSanaei/3x-ui/license?ref=ece16559397f756513d7338f59168049dd6e2e51",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/MHSanaei/3x-ui.git",
          "revision": "ece16559397f756513d7338f59168049dd6e2e51",
          "ref": "ece16559397f756513d7338f59168049dd6e2e51"
        }
      ]
    },
    {
      "id": "paperless-ngx-paperless-ngx",
      "path": "paperless-ngx-paperless-ngx",
      "license": "GPL-3.0-only",
      "source": {
        "name": "paperless-ngx/paperless-ngx",
        "version": "17dc482872cf62e12965f6207772c83d1deb651b",
        "url": "https://github.com/paperless-ngx/paperless-ngx",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/paperless-ngx/paperless-ngx/license?ref=17dc482872cf62e12965f6207772c83d1deb651b",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/paperless-ngx/paperless-ngx.git",
          "revision": "17dc482872cf62e12965f6207772c83d1deb651b",
          "ref": "17dc482872cf62e12965f6207772c83d1deb651b"
        }
      ]
    },
    {
      "id": "mifi-lossless-cut",
      "path": "mifi-lossless-cut",
      "license": "GPL-2.0-only",
      "source": {
        "name": "mifi/lossless-cut",
        "version": "3b9a59c288bf6e11076b583c932cfa48ddab3b02",
        "url": "https://github.com/mifi/lossless-cut",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mifi/lossless-cut/license?ref=3b9a59c288bf6e11076b583c932cfa48ddab3b02",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/mifi/lossless-cut.git",
          "revision": "3b9a59c288bf6e11076b583c932cfa48ddab3b02",
          "ref": "3b9a59c288bf6e11076b583c932cfa48ddab3b02"
        }
      ]
    },
    {
      "id": "666ghj-bettafish",
      "path": "666ghj-bettafish",
      "license": "GPL-2.0-only",
      "source": {
        "name": "666ghj/BettaFish",
        "version": "dcd309dfc08480708e41af0c9f7b2e68db191a25",
        "url": "https://github.com/666ghj/BettaFish",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/666ghj/BettaFish/license?ref=dcd309dfc08480708e41af0c9f7b2e68db191a25",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/666ghj/BettaFish.git",
          "revision": "dcd309dfc08480708e41af0c9f7b2e68db191a25",
          "ref": "dcd309dfc08480708e41af0c9f7b2e68db191a25"
        }
      ]
    },
    {
      "id": "aria2-aria2",
      "path": "aria2-aria2",
      "license": "GPL-2.0-only",
      "source": {
        "name": "aria2/aria2",
        "version": "9e7273583f83e881e3ec067b523ba88724088d2f",
        "url": "https://github.com/aria2/aria2",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/aria2/aria2/license?ref=9e7273583f83e881e3ec067b523ba88724088d2f",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/aria2/aria2.git",
          "revision": "9e7273583f83e881e3ec067b523ba88724088d2f",
          "ref": "9e7273583f83e881e3ec067b523ba88724088d2f"
        }
      ]
    },
    {
      "id": "chatboxai-chatbox",
      "path": "chatboxai-chatbox",
      "license": "GPL-3.0-only",
      "source": {
        "name": "chatboxai/chatbox",
        "version": "5c7e38828699aefa4efd17b44f817aa263c8f900",
        "url": "https://github.com/chatboxai/chatbox",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/chatboxai/chatbox/license?ref=5c7e38828699aefa4efd17b44f817aa263c8f900",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/chatboxai/chatbox.git",
          "revision": "5c7e38828699aefa4efd17b44f817aa263c8f900",
          "ref": "5c7e38828699aefa4efd17b44f817aa263c8f900"
        }
      ]
    },
    {
      "id": "bailicangdu-vue2-elm",
      "path": "bailicangdu-vue2-elm",
      "license": "GPL-2.0-only",
      "source": {
        "name": "bailicangdu/vue2-elm",
        "version": "b85ff0220366be863868269177a4abf74c7a85ca",
        "url": "https://github.com/bailicangdu/vue2-elm",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bailicangdu/vue2-elm/license?ref=b85ff0220366be863868269177a4abf74c7a85ca",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/bailicangdu/vue2-elm.git",
          "revision": "b85ff0220366be863868269177a4abf74c7a85ca",
          "ref": "b85ff0220366be863868269177a4abf74c7a85ca"
        }
      ]
    },
    {
      "id": "corentinth-it-tools",
      "path": "corentinth-it-tools",
      "license": "GPL-3.0-only",
      "source": {
        "name": "CorentinTh/it-tools",
        "version": "d505845f918e946ec300af7b36efc107e2f66e9e",
        "url": "https://github.com/CorentinTh/it-tools",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/CorentinTh/it-tools/license?ref=d505845f918e946ec300af7b36efc107e2f66e9e",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/CorentinTh/it-tools.git",
          "revision": "d505845f918e946ec300af7b36efc107e2f66e9e",
          "ref": "d505845f918e946ec300af7b36efc107e2f66e9e"
        }
      ]
    },
    {
      "id": "lizardbyte-sunshine",
      "path": "lizardbyte-sunshine",
      "license": "GPL-3.0-only",
      "source": {
        "name": "LizardByte/Sunshine",
        "version": "25c06d79b54f3d092d3fedd5f5ba44989f394692",
        "url": "https://github.com/LizardByte/Sunshine",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/LizardByte/Sunshine/license?ref=25c06d79b54f3d092d3fedd5f5ba44989f394692",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/LizardByte/Sunshine.git",
          "revision": "25c06d79b54f3d092d3fedd5f5ba44989f394692",
          "ref": "25c06d79b54f3d092d3fedd5f5ba44989f394692"
        }
      ]
    },
    {
      "id": "koalaman-shellcheck",
      "path": "koalaman-shellcheck",
      "license": "GPL-3.0-only",
      "source": {
        "name": "koalaman/shellcheck",
        "version": "9af7ee28ce587baadd950b85dd6826a16b9c068d",
        "url": "https://github.com/koalaman/shellcheck",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/koalaman/shellcheck/license?ref=9af7ee28ce587baadd950b85dd6826a16b9c068d",
          "declaration": "GPL-3.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Haskell"
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
          "url": "https://github.com/koalaman/shellcheck.git",
          "revision": "9af7ee28ce587baadd950b85dd6826a16b9c068d",
          "ref": "9af7ee28ce587baadd950b85dd6826a16b9c068d"
        }
      ]
    },
    {
      "id": "halo-dev-halo",
      "path": "halo-dev-halo",
      "license": "GPL-3.0-only",
      "source": {
        "name": "halo-dev/halo",
        "version": "815292f426d8f216d02398a2813dc9a52d881775",
        "url": "https://github.com/halo-dev/halo",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/halo-dev/halo/license?ref=815292f426d8f216d02398a2813dc9a52d881775",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/halo-dev/halo.git",
          "revision": "815292f426d8f216d02398a2813dc9a52d881775",
          "ref": "815292f426d8f216d02398a2813dc9a52d881775"
        }
      ]
    },
    {
      "id": "teamnewpipe-newpipe",
      "path": "teamnewpipe-newpipe",
      "license": "GPL-3.0-only",
      "source": {
        "name": "TeamNewPipe/NewPipe",
        "version": "89d2423692918653134e79a841d96e065175e976",
        "url": "https://github.com/TeamNewPipe/NewPipe",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/TeamNewPipe/NewPipe/license?ref=89d2423692918653134e79a841d96e065175e976",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/TeamNewPipe/NewPipe.git",
          "revision": "89d2423692918653134e79a841d96e065175e976",
          "ref": "89d2423692918653134e79a841d96e065175e976"
        }
      ]
    },
    {
      "id": "sharex-sharex",
      "path": "sharex-sharex",
      "license": "GPL-3.0-only",
      "source": {
        "name": "ShareX/ShareX",
        "version": "b1a388ebd428e49fd9909e9319c2ce8e93577f67",
        "url": "https://github.com/ShareX/ShareX",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ShareX/ShareX/license?ref=b1a388ebd428e49fd9909e9319c2ce8e93577f67",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/ShareX/ShareX.git",
          "revision": "b1a388ebd428e49fd9909e9319c2ce8e93577f67",
          "ref": "b1a388ebd428e49fd9909e9319c2ce8e93577f67"
        }
      ]
    },
    {
      "id": "huiyadanli-revokemsgpatcher",
      "path": "huiyadanli-revokemsgpatcher",
      "license": "GPL-3.0-only",
      "source": {
        "name": "huiyadanli/RevokeMsgPatcher",
        "version": "939dfaf00a2fcec90674c4ffddb37b6773460c51",
        "url": "https://github.com/huiyadanli/RevokeMsgPatcher",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/huiyadanli/RevokeMsgPatcher/license?ref=939dfaf00a2fcec90674c4ffddb37b6773460c51",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/huiyadanli/RevokeMsgPatcher.git",
          "revision": "939dfaf00a2fcec90674c4ffddb37b6773460c51",
          "ref": "939dfaf00a2fcec90674c4ffddb37b6773460c51"
        }
      ]
    },
    {
      "id": "frappe-erpnext",
      "path": "frappe-erpnext",
      "license": "GPL-3.0-only",
      "source": {
        "name": "frappe/erpnext",
        "version": "53d3ba7a7820e3c09b24a698149a63ecfc523e84",
        "url": "https://github.com/frappe/erpnext",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/frappe/erpnext/license?ref=53d3ba7a7820e3c09b24a698149a63ecfc523e84",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/frappe/erpnext.git",
          "revision": "53d3ba7a7820e3c09b24a698149a63ecfc523e84",
          "ref": "53d3ba7a7820e3c09b24a698149a63ecfc523e84"
        }
      ]
    },
    {
      "id": "pbatard-rufus",
      "path": "pbatard-rufus",
      "license": "GPL-3.0-only",
      "source": {
        "name": "pbatard/rufus",
        "version": "6d8fbf98305ff37eb531c45cbd6ff44563c53917",
        "url": "https://github.com/pbatard/rufus",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/pbatard/rufus/license?ref=6d8fbf98305ff37eb531c45cbd6ff44563c53917",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/pbatard/rufus.git",
          "revision": "6d8fbf98305ff37eb531c45cbd6ff44563c53917",
          "ref": "6d8fbf98305ff37eb531c45cbd6ff44563c53917"
        }
      ]
    },
    {
      "id": "1panel-dev-1panel",
      "path": "1panel-dev-1panel",
      "license": "GPL-3.0-only",
      "source": {
        "name": "1Panel-dev/1Panel",
        "version": "d1558c5eaea9bcafef5f3a885af279ad5ccd8d25",
        "url": "https://github.com/1Panel-dev/1Panel",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/1Panel-dev/1Panel/license?ref=d1558c5eaea9bcafef5f3a885af279ad5ccd8d25",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/1Panel-dev/1Panel.git",
          "revision": "d1558c5eaea9bcafef5f3a885af279ad5ccd8d25",
          "ref": "d1558c5eaea9bcafef5f3a885af279ad5ccd8d25"
        }
      ]
    },
    {
      "id": "zuodaotech-everyone-can-use-english",
      "path": "zuodaotech-everyone-can-use-english",
      "license": "GPL-3.0-only",
      "source": {
        "name": "ZuodaoTech/everyone-can-use-english",
        "version": "3d799132046993eade5a364ddd1e557906854eda",
        "url": "https://github.com/ZuodaoTech/everyone-can-use-english",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ZuodaoTech/everyone-can-use-english/license?ref=3d799132046993eade5a364ddd1e557906854eda",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/ZuodaoTech/everyone-can-use-english.git",
          "revision": "3d799132046993eade5a364ddd1e557906854eda",
          "ref": "3d799132046993eade5a364ddd1e557906854eda"
        }
      ]
    },
    {
      "id": "alvarotrigo-fullpage.js",
      "path": "alvarotrigo-fullpage.js",
      "license": "GPL-3.0-only",
      "source": {
        "name": "alvarotrigo/fullPage.js",
        "version": "49f15effa7b195def295a36f872c28153cf9fb00",
        "url": "https://github.com/alvarotrigo/fullPage.js",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/alvarotrigo/fullPage.js/license?ref=49f15effa7b195def295a36f872c28153cf9fb00",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/alvarotrigo/fullPage.js.git",
          "revision": "49f15effa7b195def295a36f872c28153cf9fb00",
          "ref": "49f15effa7b195def295a36f872c28153cf9fb00"
        }
      ]
    },
    {
      "id": "kovidgoyal-kitty",
      "path": "kovidgoyal-kitty",
      "license": "GPL-3.0-only",
      "source": {
        "name": "kovidgoyal/kitty",
        "version": "a6d5e7145a3fc36822bcf5296e4b1f1194239f48",
        "url": "https://github.com/kovidgoyal/kitty",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/kovidgoyal/kitty/license?ref=a6d5e7145a3fc36822bcf5296e4b1f1194239f48",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/kovidgoyal/kitty.git",
          "revision": "a6d5e7145a3fc36822bcf5296e4b1f1194239f48",
          "ref": "a6d5e7145a3fc36822bcf5296e4b1f1194239f48"
        }
      ]
    },
    {
      "id": "ehang-io-nps",
      "path": "ehang-io-nps",
      "license": "GPL-3.0-only",
      "source": {
        "name": "ehang-io/nps",
        "version": "ab648d6f0c618c690a7a79948a7ebd686e1cdafc",
        "url": "https://github.com/ehang-io/nps",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ehang-io/nps/license?ref=ab648d6f0c618c690a7a79948a7ebd686e1cdafc",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/ehang-io/nps.git",
          "revision": "ab648d6f0c618c690a7a79948a7ebd686e1cdafc",
          "ref": "ab648d6f0c618c690a7a79948a7ebd686e1cdafc"
        }
      ]
    },
    {
      "id": "valinet-explorerpatcher",
      "path": "valinet-explorerpatcher",
      "license": "GPL-2.0-only",
      "source": {
        "name": "valinet/ExplorerPatcher",
        "version": "0a88a6e0ef6b1752fea36e581cffff1097e862b0",
        "url": "https://github.com/valinet/ExplorerPatcher",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/valinet/ExplorerPatcher/license?ref=0a88a6e0ef6b1752fea36e581cffff1097e862b0",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/valinet/ExplorerPatcher.git",
          "revision": "0a88a6e0ef6b1752fea36e581cffff1097e862b0",
          "ref": "0a88a6e0ef6b1752fea36e581cffff1097e862b0"
        }
      ]
    },
    {
      "id": "bilibili-ijkplayer",
      "path": "bilibili-ijkplayer",
      "license": "GPL-2.0-only",
      "source": {
        "name": "bilibili/ijkplayer",
        "version": "30eb9441945da795079492041a791c121d2b8206",
        "url": "https://github.com/bilibili/ijkplayer",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bilibili/ijkplayer/license?ref=30eb9441945da795079492041a791c121d2b8206",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/bilibili/ijkplayer.git",
          "revision": "30eb9441945da795079492041a791c121d2b8206",
          "ref": "30eb9441945da795079492041a791c121d2b8206"
        }
      ]
    },
    {
      "id": "shadowsocks-shadowsocksx-ng",
      "path": "shadowsocks-shadowsocksx-ng",
      "license": "GPL-3.0-only",
      "source": {
        "name": "shadowsocks/ShadowsocksX-NG",
        "version": "719203afc60e1dbab00e459ebcfecc468e7700bd",
        "url": "https://github.com/shadowsocks/ShadowsocksX-NG",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/shadowsocks/ShadowsocksX-NG/license?ref=719203afc60e1dbab00e459ebcfecc468e7700bd",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/shadowsocks/ShadowsocksX-NG.git",
          "revision": "719203afc60e1dbab00e459ebcfecc468e7700bd",
          "ref": "719203afc60e1dbab00e459ebcfecc468e7700bd"
        }
      ]
    },
    {
      "id": "shadps4-emu-shadps4",
      "path": "shadps4-emu-shadps4",
      "license": "GPL-2.0-only",
      "source": {
        "name": "shadps4-emu/shadPS4",
        "version": "c5ae3c681276bd884b9b714c2099d55796c36154",
        "url": "https://github.com/shadps4-emu/shadPS4",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/shadps4-emu/shadPS4/license?ref=c5ae3c681276bd884b9b714c2099d55796c36154",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/shadps4-emu/shadPS4.git",
          "revision": "c5ae3c681276bd884b9b714c2099d55796c36154",
          "ref": "c5ae3c681276bd884b9b714c2099d55796c36154"
        }
      ]
    },
    {
      "id": "facebook-rocksdb",
      "path": "facebook-rocksdb",
      "license": "GPL-2.0-only",
      "source": {
        "name": "facebook/rocksdb",
        "version": "1dfa7297933df05237ac11376d6cb69d32591b1d",
        "url": "https://github.com/facebook/rocksdb",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/facebook/rocksdb/license?ref=1dfa7297933df05237ac11376d6cb69d32591b1d",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/facebook/rocksdb.git",
          "revision": "1dfa7297933df05237ac11376d6cb69d32591b1d",
          "ref": "1dfa7297933df05237ac11376d6cb69d32591b1d"
        }
      ]
    },
    {
      "id": "gethomepage-homepage",
      "path": "gethomepage-homepage",
      "license": "GPL-3.0-only",
      "source": {
        "name": "gethomepage/homepage",
        "version": "1a047d1dfc135fd3c904699f562dd9ea892088e6",
        "url": "https://github.com/gethomepage/homepage",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/gethomepage/homepage/license?ref=1a047d1dfc135fd3c904699f562dd9ea892088e6",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/gethomepage/homepage.git",
          "revision": "1a047d1dfc135fd3c904699f562dd9ea892088e6",
          "ref": "1a047d1dfc135fd3c904699f562dd9ea892088e6"
        }
      ]
    },
    {
      "id": "jumpserver-jumpserver",
      "path": "jumpserver-jumpserver",
      "license": "GPL-3.0-only",
      "source": {
        "name": "jumpserver/jumpserver",
        "version": "93214a3067ad80b04d036122eeab33f2539e3633",
        "url": "https://github.com/jumpserver/jumpserver",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jumpserver/jumpserver/license?ref=93214a3067ad80b04d036122eeab33f2539e3633",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/jumpserver/jumpserver.git",
          "revision": "93214a3067ad80b04d036122eeab33f2539e3633",
          "ref": "93214a3067ad80b04d036122eeab33f2539e3633"
        }
      ]
    },
    {
      "id": "flameshot-org-flameshot",
      "path": "flameshot-org-flameshot",
      "license": "GPL-3.0-only",
      "source": {
        "name": "flameshot-org/flameshot",
        "version": "52260408e3a3b810095d8e7661ca2911cb46ea57",
        "url": "https://github.com/flameshot-org/flameshot",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/flameshot-org/flameshot/license?ref=52260408e3a3b810095d8e7661ca2911cb46ea57",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/flameshot-org/flameshot.git",
          "revision": "52260408e3a3b810095d8e7661ca2911cb46ea57",
          "ref": "52260408e3a3b810095d8e7661ca2911cb46ea57"
        }
      ]
    },
    {
      "id": "maboloshi-github-chinese",
      "path": "maboloshi-github-chinese",
      "license": "GPL-3.0-only",
      "source": {
        "name": "maboloshi/github-chinese",
        "version": "bf852c09a2ee1e4d832af62d50e4f839ad3514e1",
        "url": "https://github.com/maboloshi/github-chinese",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/maboloshi/github-chinese/license?ref=bf852c09a2ee1e4d832af62d50e4f839ad3514e1",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/maboloshi/github-chinese.git",
          "revision": "bf852c09a2ee1e4d832af62d50e4f839ad3514e1",
          "ref": "bf852c09a2ee1e4d832af62d50e4f839ad3514e1"
        }
      ]
    },
    {
      "id": "xuxueli-xxl-job",
      "path": "xuxueli-xxl-job",
      "license": "GPL-3.0-only",
      "source": {
        "name": "xuxueli/xxl-job",
        "version": "e74c784f68f81fa89cb350913ef15794865d7b12",
        "url": "https://github.com/xuxueli/xxl-job",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/xuxueli/xxl-job/license?ref=e74c784f68f81fa89cb350913ef15794865d7b12",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/xuxueli/xxl-job.git",
          "revision": "e74c784f68f81fa89cb350913ef15794865d7b12",
          "ref": "e74c784f68f81fa89cb350913ef15794865d7b12"
        }
      ]
    },
    {
      "id": "drklo-telegram",
      "path": "drklo-telegram",
      "license": "GPL-2.0-only",
      "source": {
        "name": "DrKLO/Telegram",
        "version": "45ab8f4308496e1f01026a97fcdb0d58a5274474",
        "url": "https://github.com/DrKLO/Telegram",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/DrKLO/Telegram/license?ref=45ab8f4308496e1f01026a97fcdb0d58a5274474",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/DrKLO/Telegram.git",
          "revision": "45ab8f4308496e1f01026a97fcdb0d58a5274474",
          "ref": "45ab8f4308496e1f01026a97fcdb0d58a5274474"
        }
      ]
    },
    {
      "id": "233boy-v2ray",
      "path": "233boy-v2ray",
      "license": "GPL-3.0-only",
      "source": {
        "name": "233boy/v2ray",
        "version": "707ecf7601ff49f91c2d12dd22b98e8f89588d1c",
        "url": "https://github.com/233boy/v2ray",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/233boy/v2ray/license?ref=707ecf7601ff49f91c2d12dd22b98e8f89588d1c",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/233boy/v2ray.git",
          "revision": "707ecf7601ff49f91c2d12dd22b98e8f89588d1c",
          "ref": "707ecf7601ff49f91c2d12dd22b98e8f89588d1c"
        }
      ]
    },
    {
      "id": "python-telegram-bot-python-telegram-bot",
      "path": "python-telegram-bot-python-telegram-bot",
      "license": "GPL-3.0-only",
      "source": {
        "name": "python-telegram-bot/python-telegram-bot",
        "version": "377f5effb3afc2d9b1e7e1de1b908b26cc87fd17",
        "url": "https://github.com/python-telegram-bot/python-telegram-bot",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/python-telegram-bot/python-telegram-bot/license?ref=377f5effb3afc2d9b1e7e1de1b908b26cc87fd17",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/python-telegram-bot/python-telegram-bot.git",
          "revision": "377f5effb3afc2d9b1e7e1de1b908b26cc87fd17",
          "ref": "377f5effb3afc2d9b1e7e1de1b908b26cc87fd17"
        }
      ]
    },
    {
      "id": "slymnoyann-hey-1",
      "path": "slymnoyann-hey-1",
      "license": "GPL-3.0-only",
      "source": {
        "name": "slymnoyann/hey-1",
        "version": "88c8f9d55340d57a37846ff72f55c2c604e3a566",
        "url": "https://github.com/slymnoyann/hey-1",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/slymnoyann/hey-1/license?ref=88c8f9d55340d57a37846ff72f55c2c604e3a566",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/slymnoyann/hey-1.git",
          "revision": "88c8f9d55340d57a37846ff72f55c2c604e3a566",
          "ref": "88c8f9d55340d57a37846ff72f55c2c604e3a566"
        }
      ]
    },
    {
      "id": "librepods-org-librepods",
      "path": "librepods-org-librepods",
      "license": "GPL-3.0-only",
      "source": {
        "name": "librepods-org/librepods",
        "version": "b5a3eaee8fbe5a0c83c360bb0fdcd6705a59cc25",
        "url": "https://github.com/librepods-org/librepods",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/librepods-org/librepods/license?ref=b5a3eaee8fbe5a0c83c360bb0fdcd6705a59cc25",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/librepods-org/librepods.git",
          "revision": "b5a3eaee8fbe5a0c83c360bb0fdcd6705a59cc25",
          "ref": "b5a3eaee8fbe5a0c83c360bb0fdcd6705a59cc25"
        }
      ]
    },
    {
      "id": "jordanbaird-ice",
      "path": "jordanbaird-ice",
      "license": "GPL-3.0-only",
      "source": {
        "name": "jordanbaird/Ice",
        "version": "11edd39115f3f43a83ae114b5348df6a0e1741cf",
        "url": "https://github.com/jordanbaird/Ice",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jordanbaird/Ice/license?ref=11edd39115f3f43a83ae114b5348df6a0e1741cf",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/jordanbaird/Ice.git",
          "revision": "11edd39115f3f43a83ae114b5348df6a0e1741cf",
          "ref": "11edd39115f3f43a83ae114b5348df6a0e1741cf"
        }
      ]
    },
    {
      "id": "revanced-revanced-manager",
      "path": "revanced-revanced-manager",
      "license": "GPL-3.0-only",
      "source": {
        "name": "ReVanced/revanced-manager",
        "version": "2a88257b71d35c9f141907ffea67c87e51bbb0db",
        "url": "https://github.com/ReVanced/revanced-manager",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ReVanced/revanced-manager/license?ref=2a88257b71d35c9f141907ffea67c87e51bbb0db",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/ReVanced/revanced-manager.git",
          "revision": "2a88257b71d35c9f141907ffea67c87e51bbb0db",
          "ref": "2a88257b71d35c9f141907ffea67c87e51bbb0db"
        }
      ]
    },
    {
      "id": "predidit-kazumi",
      "path": "predidit-kazumi",
      "license": "GPL-3.0-only",
      "source": {
        "name": "Predidit/Kazumi",
        "version": "c5e3feb43bcdb576d9639649991ebad77c1ab31f",
        "url": "https://github.com/Predidit/Kazumi",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Predidit/Kazumi/license?ref=c5e3feb43bcdb576d9639649991ebad77c1ab31f",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/Predidit/Kazumi.git",
          "revision": "c5e3feb43bcdb576d9639649991ebad77c1ab31f",
          "ref": "c5e3feb43bcdb576d9639649991ebad77c1ab31f"
        }
      ]
    },
    {
      "id": "anuken-mindustry",
      "path": "anuken-mindustry",
      "license": "GPL-3.0-only",
      "source": {
        "name": "Anuken/Mindustry",
        "version": "269a3f58415cda92af1b55038924f5865bc17a0e",
        "url": "https://github.com/Anuken/Mindustry",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Anuken/Mindustry/license?ref=269a3f58415cda92af1b55038924f5865bc17a0e",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/Anuken/Mindustry.git",
          "revision": "269a3f58415cda92af1b55038924f5865bc17a0e",
          "ref": "269a3f58415cda92af1b55038924f5865bc17a0e"
        }
      ]
    },
    {
      "id": "cloudreve-cloudreve",
      "path": "cloudreve-cloudreve",
      "license": "GPL-3.0-only",
      "source": {
        "name": "cloudreve/cloudreve",
        "version": "20c95ad73f3a8bcb72887fea91ff31ab24fa1011",
        "url": "https://github.com/cloudreve/cloudreve",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/cloudreve/cloudreve/license?ref=20c95ad73f3a8bcb72887fea91ff31ab24fa1011",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/cloudreve/cloudreve.git",
          "revision": "20c95ad73f3a8bcb72887fea91ff31ab24fa1011",
          "ref": "20c95ad73f3a8bcb72887fea91ff31ab24fa1011"
        }
      ]
    },
    {
      "id": "nvchad-nvchad",
      "path": "nvchad-nvchad",
      "license": "GPL-3.0-only",
      "source": {
        "name": "NvChad/NvChad",
        "version": "add44b952d631981614bbb8cfc6f7002f296dfe6",
        "url": "https://github.com/NvChad/NvChad",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/NvChad/NvChad/license?ref=add44b952d631981614bbb8cfc6f7002f296dfe6",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/NvChad/NvChad.git",
          "revision": "add44b952d631981614bbb8cfc6f7002f296dfe6",
          "ref": "add44b952d631981614bbb8cfc6f7002f296dfe6"
        }
      ]
    },
    {
      "id": "fanmingming-live",
      "path": "fanmingming-live",
      "license": "GPL-3.0-only",
      "source": {
        "name": "fanmingming/live",
        "version": "b085d39e05d126f91709d7a545604bd667a6f026",
        "url": "https://github.com/fanmingming/live",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/fanmingming/live/license?ref=b085d39e05d126f91709d7a545604bd667a6f026",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/fanmingming/live.git",
          "revision": "b085d39e05d126f91709d7a545604bd667a6f026",
          "ref": "b085d39e05d126f91709d7a545604bd667a6f026"
        }
      ]
    },
    {
      "id": "junkfood02-seal",
      "path": "junkfood02-seal",
      "license": "GPL-3.0-only",
      "source": {
        "name": "JunkFood02/Seal",
        "version": "44e0d2e6fc26177e0da4cb1948223baa13b0887f",
        "url": "https://github.com/JunkFood02/Seal",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/JunkFood02/Seal/license?ref=44e0d2e6fc26177e0da4cb1948223baa13b0887f",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/JunkFood02/Seal.git",
          "revision": "44e0d2e6fc26177e0da4cb1948223baa13b0887f",
          "ref": "44e0d2e6fc26177e0da4cb1948223baa13b0887f"
        }
      ]
    },
    {
      "id": "deskflow-deskflow",
      "path": "deskflow-deskflow",
      "license": "GPL-2.0-only",
      "source": {
        "name": "deskflow/deskflow",
        "version": "f765e829f2373f055331e910d69b8c8b8006952b",
        "url": "https://github.com/deskflow/deskflow",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/deskflow/deskflow/license?ref=f765e829f2373f055331e910d69b8c8b8006952b",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/deskflow/deskflow.git",
          "revision": "f765e829f2373f055331e910d69b8c8b8006952b",
          "ref": "f765e829f2373f055331e910d69b8c8b8006952b"
        }
      ]
    },
    {
      "id": "wox-launcher-wox",
      "path": "wox-launcher-wox",
      "license": "GPL-3.0-only",
      "source": {
        "name": "Wox-launcher/Wox",
        "version": "2e1db9c38a7bb03ecbd67cec4c47bf39c3633880",
        "url": "https://github.com/Wox-launcher/Wox",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Wox-launcher/Wox/license?ref=2e1db9c38a7bb03ecbd67cec4c47bf39c3633880",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/Wox-launcher/Wox.git",
          "revision": "2e1db9c38a7bb03ecbd67cec4c47bf39c3633880",
          "ref": "2e1db9c38a7bb03ecbd67cec4c47bf39c3633880"
        }
      ]
    },
    {
      "id": "niri-wm-niri",
      "path": "niri-wm-niri",
      "license": "GPL-3.0-only",
      "source": {
        "name": "niri-wm/niri",
        "version": "59a10015610bb7d068a82ce1c386fcd8b44f6c52",
        "url": "https://github.com/niri-wm/niri",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/niri-wm/niri/license?ref=59a10015610bb7d068a82ce1c386fcd8b44f6c52",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/niri-wm/niri.git",
          "revision": "59a10015610bb7d068a82ce1c386fcd8b44f6c52",
          "ref": "59a10015610bb7d068a82ce1c386fcd8b44f6c52"
        }
      ]
    },
    {
      "id": "schniz-fnm",
      "path": "schniz-fnm",
      "license": "GPL-3.0-only",
      "source": {
        "name": "Schniz/fnm",
        "version": "86adc9676ceb2a509b21e75e74048b93c89f097d",
        "url": "https://github.com/Schniz/fnm",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Schniz/fnm/license?ref=86adc9676ceb2a509b21e75e74048b93c89f097d",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/Schniz/fnm.git",
          "revision": "86adc9676ceb2a509b21e75e74048b93c89f097d",
          "ref": "86adc9676ceb2a509b21e75e74048b93c89f097d"
        }
      ]
    },
    {
      "id": "beyonddimension-steamtools",
      "path": "beyonddimension-steamtools",
      "license": "GPL-3.0-only",
      "source": {
        "name": "BeyondDimension/SteamTools",
        "version": "c16ffa08e03b192d23ada290c4969e77f9201f3d",
        "url": "https://github.com/BeyondDimension/SteamTools",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/BeyondDimension/SteamTools/license?ref=c16ffa08e03b192d23ada290c4969e77f9201f3d",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/BeyondDimension/SteamTools.git",
          "revision": "c16ffa08e03b192d23ada290c4969e77f9201f3d",
          "ref": "c16ffa08e03b192d23ada290c4969e77f9201f3d"
        }
      ]
    },
    {
      "id": "typesense-typesense",
      "path": "typesense-typesense",
      "license": "GPL-3.0-only",
      "source": {
        "name": "typesense/typesense",
        "version": "2b1ea8002cfa6febc212123deec6c6bed66837b3",
        "url": "https://github.com/typesense/typesense",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/typesense/typesense/license?ref=2b1ea8002cfa6febc212123deec6c6bed66837b3",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/typesense/typesense.git",
          "revision": "2b1ea8002cfa6febc212123deec6c6bed66837b3",
          "ref": "2b1ea8002cfa6febc212123deec6c6bed66837b3"
        }
      ]
    },
    {
      "id": "ycm-core-youcompleteme",
      "path": "ycm-core-youcompleteme",
      "license": "GPL-3.0-only",
      "source": {
        "name": "ycm-core/YouCompleteMe",
        "version": "d4c91430b70a21ce471c8572400b647d313995b4",
        "url": "https://github.com/ycm-core/YouCompleteMe",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/ycm-core/YouCompleteMe/license?ref=d4c91430b70a21ce471c8572400b647d313995b4",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/ycm-core/YouCompleteMe.git",
          "revision": "d4c91430b70a21ce471c8572400b647d313995b4",
          "ref": "d4c91430b70a21ce471c8572400b647d313995b4"
        }
      ]
    },
    {
      "id": "mihomo-party-org-clash-party",
      "path": "mihomo-party-org-clash-party",
      "license": "GPL-3.0-only",
      "source": {
        "name": "mihomo-party-org/clash-party",
        "version": "8af583e771b218d33174e3897ac7b5bdec1cb302",
        "url": "https://github.com/mihomo-party-org/clash-party",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mihomo-party-org/clash-party/license?ref=8af583e771b218d33174e3897ac7b5bdec1cb302",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/mihomo-party-org/clash-party.git",
          "revision": "8af583e771b218d33174e3897ac7b5bdec1cb302",
          "ref": "8af583e771b218d33174e3897ac7b5bdec1cb302"
        }
      ]
    },
    {
      "id": "zhaoolee-chromeappheroes",
      "path": "zhaoolee-chromeappheroes",
      "license": "GPL-3.0-only",
      "source": {
        "name": "zhaoolee/ChromeAppHeroes",
        "version": "abe715d5059c415225e2a1e42ecf67d0aa65b5a1",
        "url": "https://github.com/zhaoolee/ChromeAppHeroes",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/zhaoolee/ChromeAppHeroes/license?ref=abe715d5059c415225e2a1e42ecf67d0aa65b5a1",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/zhaoolee/ChromeAppHeroes.git",
          "revision": "abe715d5059c415225e2a1e42ecf67d0aa65b5a1",
          "ref": "abe715d5059c415225e2a1e42ecf67d0aa65b5a1"
        }
      ]
    },
    {
      "id": "gopeedlab-gopeed",
      "path": "gopeedlab-gopeed",
      "license": "GPL-3.0-only",
      "source": {
        "name": "GopeedLab/gopeed",
        "version": "fdfc6902a7750a3628735e8bf37d739bfda9549c",
        "url": "https://github.com/GopeedLab/gopeed",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/GopeedLab/gopeed/license?ref=fdfc6902a7750a3628735e8bf37d739bfda9549c",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/GopeedLab/gopeed.git",
          "revision": "fdfc6902a7750a3628735e8bf37d739bfda9549c",
          "ref": "fdfc6902a7750a3628735e8bf37d739bfda9549c"
        }
      ]
    },
    {
      "id": "argotorg-solidity",
      "path": "argotorg-solidity",
      "license": "GPL-3.0-only",
      "source": {
        "name": "argotorg/solidity",
        "version": "9b2f86bebbbc22c7c9f5ca41884d47fcc1d0639a",
        "url": "https://github.com/argotorg/solidity",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/argotorg/solidity/license?ref=9b2f86bebbbc22c7c9f5ca41884d47fcc1d0639a",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/argotorg/solidity.git",
          "revision": "9b2f86bebbbc22c7c9f5ca41884d47fcc1d0639a",
          "ref": "9b2f86bebbbc22c7c9f5ca41884d47fcc1d0639a"
        }
      ]
    },
    {
      "id": "syl20bnr-spacemacs",
      "path": "syl20bnr-spacemacs",
      "license": "GPL-3.0-only",
      "source": {
        "name": "syl20bnr/spacemacs",
        "version": "47c09c5777a33ecd59ea0456829041464883135a",
        "url": "https://github.com/syl20bnr/spacemacs",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/syl20bnr/spacemacs/license?ref=47c09c5777a33ecd59ea0456829041464883135a",
          "declaration": "GPL-3.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Emacs Lisp"
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
          "url": "https://github.com/syl20bnr/spacemacs.git",
          "revision": "47c09c5777a33ecd59ea0456829041464883135a",
          "ref": "47c09c5777a33ecd59ea0456829041464883135a"
        }
      ]
    },
    {
      "id": "ql-win-quicklook",
      "path": "ql-win-quicklook",
      "license": "GPL-3.0-only",
      "source": {
        "name": "QL-Win/QuickLook",
        "version": "cb5d9c429c81d9796fac469da2a68efb5626946d",
        "url": "https://github.com/QL-Win/QuickLook",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/QL-Win/QuickLook/license?ref=cb5d9c429c81d9796fac469da2a68efb5626946d",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/QL-Win/QuickLook.git",
          "revision": "cb5d9c429c81d9796fac469da2a68efb5626946d",
          "ref": "cb5d9c429c81d9796fac469da2a68efb5626946d"
        }
      ]
    },
    {
      "id": "lsposed-lsposed",
      "path": "lsposed-lsposed",
      "license": "GPL-3.0-only",
      "source": {
        "name": "LSPosed/LSPosed",
        "version": "df74d83eb03a44cc6ad268841ac2ada28d077c77",
        "url": "https://github.com/LSPosed/LSPosed",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/LSPosed/LSPosed/license?ref=df74d83eb03a44cc6ad268841ac2ada28d077c77",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/LSPosed/LSPosed.git",
          "revision": "df74d83eb03a44cc6ad268841ac2ada28d077c77",
          "ref": "df74d83eb03a44cc6ad268841ac2ada28d077c77"
        }
      ]
    },
    {
      "id": "dataease-dataease",
      "path": "dataease-dataease",
      "license": "GPL-3.0-only",
      "source": {
        "name": "dataease/dataease",
        "version": "9f37143899b47c570a1d3769368641db1a2f5a5c",
        "url": "https://github.com/dataease/dataease",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/dataease/dataease/license?ref=9f37143899b47c570a1d3769368641db1a2f5a5c",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/dataease/dataease.git",
          "revision": "9f37143899b47c570a1d3769368641db1a2f5a5c",
          "ref": "9f37143899b47c570a1d3769368641db1a2f5a5c"
        }
      ]
    },
    {
      "id": "air-verse-air",
      "path": "air-verse-air",
      "license": "GPL-3.0-only",
      "source": {
        "name": "air-verse/air",
        "version": "9f19e52511f7bb697036e6ee2c12a212e742199d",
        "url": "https://github.com/air-verse/air",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/air-verse/air/license?ref=9f19e52511f7bb697036e6ee2c12a212e742199d",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/air-verse/air.git",
          "revision": "9f19e52511f7bb697036e6ee2c12a212e742199d",
          "ref": "9f19e52511f7bb697036e6ee2c12a212e742199d"
        }
      ]
    },
    {
      "id": "aldanial-cloc",
      "path": "aldanial-cloc",
      "license": "GPL-2.0-only",
      "source": {
        "name": "AlDanial/cloc",
        "version": "e94e6ec247b7a30290024d546d0fc86f3ce89261",
        "url": "https://github.com/AlDanial/cloc",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/AlDanial/cloc/license?ref=e94e6ec247b7a30290024d546d0fc86f3ce89261",
          "declaration": "GPL-2.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "Perl"
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
          "url": "https://github.com/AlDanial/cloc.git",
          "revision": "e94e6ec247b7a30290024d546d0fc86f3ce89261",
          "ref": "e94e6ec247b7a30290024d546d0fc86f3ce89261"
        }
      ]
    },
    {
      "id": "openjdk-jdk",
      "path": "openjdk-jdk",
      "license": "GPL-2.0-only",
      "source": {
        "name": "openjdk/jdk",
        "version": "20ccb7cfbde76b7ce2bb0e635934c252a187f702",
        "url": "https://github.com/openjdk/jdk",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/openjdk/jdk/license?ref=20ccb7cfbde76b7ce2bb0e635934c252a187f702",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/openjdk/jdk.git",
          "revision": "20ccb7cfbde76b7ce2bb0e635934c252a187f702",
          "ref": "20ccb7cfbde76b7ce2bb0e635934c252a187f702"
        }
      ]
    },
    {
      "id": "navidrome-navidrome",
      "path": "navidrome-navidrome",
      "license": "GPL-3.0-only",
      "source": {
        "name": "navidrome/navidrome",
        "version": "a0bf78cdeab4d0f316edcd37094f03d09f0ede8e",
        "url": "https://github.com/navidrome/navidrome",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/navidrome/navidrome/license?ref=a0bf78cdeab4d0f316edcd37094f03d09f0ede8e",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/navidrome/navidrome.git",
          "revision": "a0bf78cdeab4d0f316edcd37094f03d09f0ede8e",
          "ref": "a0bf78cdeab4d0f316edcd37094f03d09f0ede8e"
        }
      ]
    },
    {
      "id": "mementum-backtrader",
      "path": "mementum-backtrader",
      "license": "GPL-3.0-only",
      "source": {
        "name": "mementum/backtrader",
        "version": "b853d7c90b6721476eb5a5ea3135224e33db1f14",
        "url": "https://github.com/mementum/backtrader",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mementum/backtrader/license?ref=b853d7c90b6721476eb5a5ea3135224e33db1f14",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/mementum/backtrader.git",
          "revision": "b853d7c90b6721476eb5a5ea3135224e33db1f14",
          "ref": "b853d7c90b6721476eb5a5ea3135224e33db1f14"
        }
      ]
    },
    {
      "id": "feliscatus-switchyomega",
      "path": "feliscatus-switchyomega",
      "license": "GPL-3.0-only",
      "source": {
        "name": "FelisCatus/SwitchyOmega",
        "version": "19f9d73f20125b6164fb95d17cd4cc6659df147c",
        "url": "https://github.com/FelisCatus/SwitchyOmega",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/FelisCatus/SwitchyOmega/license?ref=19f9d73f20125b6164fb95d17cd4cc6659df147c",
          "declaration": "GPL-3.0-only"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "CoffeeScript"
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
          "url": "https://github.com/FelisCatus/SwitchyOmega.git",
          "revision": "19f9d73f20125b6164fb95d17cd4cc6659df147c",
          "ref": "19f9d73f20125b6164fb95d17cd4cc6659df147c"
        }
      ]
    },
    {
      "id": "1panel-dev-maxkb",
      "path": "1panel-dev-maxkb",
      "license": "GPL-3.0-only",
      "source": {
        "name": "1Panel-dev/MaxKB",
        "version": "01b21db88145278d98bf5e9bd55e6abd6b3aad43",
        "url": "https://github.com/1Panel-dev/MaxKB",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/1Panel-dev/MaxKB/license?ref=01b21db88145278d98bf5e9bd55e6abd6b3aad43",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/1Panel-dev/MaxKB.git",
          "revision": "01b21db88145278d98bf5e9bd55e6abd6b3aad43",
          "ref": "01b21db88145278d98bf5e9bd55e6abd6b3aad43"
        }
      ]
    },
    {
      "id": "chaitin-safeline",
      "path": "chaitin-safeline",
      "license": "GPL-3.0-only",
      "source": {
        "name": "chaitin/SafeLine",
        "version": "2f27406501973da4bf8543bc9623beb624330215",
        "url": "https://github.com/chaitin/SafeLine",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/chaitin/SafeLine/license?ref=2f27406501973da4bf8543bc9623beb624330215",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/chaitin/SafeLine.git",
          "revision": "2f27406501973da4bf8543bc9623beb624330215",
          "ref": "2f27406501973da4bf8543bc9623beb624330215"
        }
      ]
    },
    {
      "id": "darkflippers-unleashed-firmware",
      "path": "darkflippers-unleashed-firmware",
      "license": "GPL-3.0-only",
      "source": {
        "name": "DarkFlippers/unleashed-firmware",
        "version": "9d4dae48fad0aaebaf87254cd0707ed6fff073de",
        "url": "https://github.com/DarkFlippers/unleashed-firmware",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/DarkFlippers/unleashed-firmware/license?ref=9d4dae48fad0aaebaf87254cd0707ed6fff073de",
          "declaration": "GPL-3.0-only"
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
          "url": "https://github.com/DarkFlippers/unleashed-firmware.git",
          "revision": "9d4dae48fad0aaebaf87254cd0707ed6fff073de",
          "ref": "9d4dae48fad0aaebaf87254cd0707ed6fff073de"
        }
      ]
    },
    {
      "id": "qmk-qmk_firmware",
      "path": "qmk-qmk_firmware",
      "license": "GPL-2.0-only",
      "source": {
        "name": "qmk/qmk_firmware",
        "version": "9caa5f871ddb9813c7370708be62d7a3e1cfeb75",
        "url": "https://github.com/qmk/qmk_firmware",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/qmk/qmk_firmware/license?ref=9caa5f871ddb9813c7370708be62d7a3e1cfeb75",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/qmk/qmk_firmware.git",
          "revision": "9caa5f871ddb9813c7370708be62d7a3e1cfeb75",
          "ref": "9caa5f871ddb9813c7370708be62d7a3e1cfeb75"
        }
      ]
    },
    {
      "id": "atmosphere-nx-atmosphere",
      "path": "atmosphere-nx-atmosphere",
      "license": "GPL-2.0-only",
      "source": {
        "name": "Atmosphere-NX/Atmosphere",
        "version": "e468f59c9d369b8ebbffa040f4c9fc201b9f75a8",
        "url": "https://github.com/Atmosphere-NX/Atmosphere",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Atmosphere-NX/Atmosphere/license?ref=e468f59c9d369b8ebbffa040f4c9fc201b9f75a8",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/Atmosphere-NX/Atmosphere.git",
          "revision": "e468f59c9d369b8ebbffa040f4c9fc201b9f75a8",
          "ref": "e468f59c9d369b8ebbffa040f4c9fc201b9f75a8"
        }
      ]
    },
    {
      "id": "rpcs3-rpcs3",
      "path": "rpcs3-rpcs3",
      "license": "GPL-2.0-only",
      "source": {
        "name": "RPCS3/rpcs3",
        "version": "8d034a36e8119165a581c0f7c6c76c5f156886e3",
        "url": "https://github.com/RPCS3/rpcs3",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/RPCS3/rpcs3/license?ref=8d034a36e8119165a581c0f7c6c76c5f156886e3",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/RPCS3/rpcs3.git",
          "revision": "8d034a36e8119165a581c0f7c6c76c5f156886e3",
          "ref": "8d034a36e8119165a581c0f7c6c76c5f156886e3"
        }
      ]
    },
    {
      "id": "videolan-vlc",
      "path": "videolan-vlc",
      "license": "GPL-2.0-only",
      "source": {
        "name": "videolan/vlc",
        "version": "329ed3135eeabd85d2f190b8e3388e7a7e441d0f",
        "url": "https://github.com/videolan/vlc",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/videolan/vlc/license?ref=329ed3135eeabd85d2f190b8e3388e7a7e441d0f",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/videolan/vlc.git",
          "revision": "329ed3135eeabd85d2f190b8e3388e7a7e441d0f",
          "ref": "329ed3135eeabd85d2f190b8e3388e7a7e441d0f"
        }
      ]
    },
    {
      "id": "kyleneideck-backgroundmusic",
      "path": "kyleneideck-backgroundmusic",
      "license": "GPL-2.0-only",
      "source": {
        "name": "kyleneideck/BackgroundMusic",
        "version": "8c25450e9b0d3867417c4872018b03fb30c0c85c",
        "url": "https://github.com/kyleneideck/BackgroundMusic",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/kyleneideck/BackgroundMusic/license?ref=8c25450e9b0d3867417c4872018b03fb30c0c85c",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/kyleneideck/BackgroundMusic.git",
          "revision": "8c25450e9b0d3867417c4872018b03fb30c0c85c",
          "ref": "8c25450e9b0d3867417c4872018b03fb30c0c85c"
        }
      ]
    },
    {
      "id": "mikf-gallery-dl",
      "path": "mikf-gallery-dl",
      "license": "GPL-2.0-only",
      "source": {
        "name": "mikf/gallery-dl",
        "version": "86047cf67a12bdb6ff1085774f8ad9fc347e8da9",
        "url": "https://github.com/mikf/gallery-dl",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mikf/gallery-dl/license?ref=86047cf67a12bdb6ff1085774f8ad9fc347e8da9",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/mikf/gallery-dl.git",
          "revision": "86047cf67a12bdb6ff1085774f8ad9fc347e8da9",
          "ref": "86047cf67a12bdb6ff1085774f8ad9fc347e8da9"
        }
      ]
    },
    {
      "id": "copytranslator-copytranslator",
      "path": "copytranslator-copytranslator",
      "license": "GPL-2.0-only",
      "source": {
        "name": "CopyTranslator/CopyTranslator",
        "version": "5b73e4262625cdcd0b4621d0e6d5f59ed08de4ef",
        "url": "https://github.com/CopyTranslator/CopyTranslator",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/CopyTranslator/CopyTranslator/license?ref=5b73e4262625cdcd0b4621d0e6d5f59ed08de4ef",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/CopyTranslator/CopyTranslator.git",
          "revision": "5b73e4262625cdcd0b4621d0e6d5f59ed08de4ef",
          "ref": "5b73e4262625cdcd0b4621d0e6d5f59ed08de4ef"
        }
      ]
    },
    {
      "id": "gnachman-iterm2",
      "path": "gnachman-iterm2",
      "license": "GPL-2.0-only",
      "source": {
        "name": "gnachman/iTerm2",
        "version": "3ec57866cd9bcf932f2675f7ca47183793a37b79",
        "url": "https://github.com/gnachman/iTerm2",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/gnachman/iTerm2/license?ref=3ec57866cd9bcf932f2675f7ca47183793a37b79",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/gnachman/iTerm2.git",
          "revision": "3ec57866cd9bcf932f2675f7ca47183793a37b79",
          "ref": "3ec57866cd9bcf932f2675f7ca47183793a37b79"
        }
      ]
    },
    {
      "id": "reactos-reactos",
      "path": "reactos-reactos",
      "license": "GPL-2.0-only",
      "source": {
        "name": "reactos/reactos",
        "version": "a318b6228a24cda9b752501470e61550e925f657",
        "url": "https://github.com/reactos/reactos",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/reactos/reactos/license?ref=a318b6228a24cda9b752501470e61550e925f657",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/reactos/reactos.git",
          "revision": "a318b6228a24cda9b752501470e61550e925f657",
          "ref": "a318b6228a24cda9b752501470e61550e925f657"
        }
      ]
    },
    {
      "id": "systemd-systemd",
      "path": "systemd-systemd",
      "license": "GPL-2.0-only",
      "source": {
        "name": "systemd/systemd",
        "version": "06cb8fbe618604f43c9a9a638e6fc3df920daa0c",
        "url": "https://github.com/systemd/systemd",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/systemd/systemd/license?ref=06cb8fbe618604f43c9a9a638e6fc3df920daa0c",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/systemd/systemd.git",
          "revision": "06cb8fbe618604f43c9a9a638e6fc3df920daa0c",
          "ref": "06cb8fbe618604f43c9a9a638e6fc3df920daa0c"
        }
      ]
    },
    {
      "id": "xournalpp-xournalpp",
      "path": "xournalpp-xournalpp",
      "license": "GPL-2.0-only",
      "source": {
        "name": "xournalpp/xournalpp",
        "version": "89bc8dbb45277ff18e888711c4e5b824400a13b4",
        "url": "https://github.com/xournalpp/xournalpp",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/xournalpp/xournalpp/license?ref=89bc8dbb45277ff18e888711c4e5b824400a13b4",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/xournalpp/xournalpp.git",
          "revision": "89bc8dbb45277ff18e888711c4e5b824400a13b4",
          "ref": "89bc8dbb45277ff18e888711c4e5b824400a13b4"
        }
      ]
    },
    {
      "id": "xcanwin-keepchatgpt",
      "path": "xcanwin-keepchatgpt",
      "license": "GPL-2.0-only",
      "source": {
        "name": "xcanwin/KeepChatGPT",
        "version": "bdc253cb96bdf7f4741d9bf87c4c6532967ffdb3",
        "url": "https://github.com/xcanwin/KeepChatGPT",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/xcanwin/KeepChatGPT/license?ref=bdc253cb96bdf7f4741d9bf87c4c6532967ffdb3",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/xcanwin/KeepChatGPT.git",
          "revision": "bdc253cb96bdf7f4741d9bf87c4c6532967ffdb3",
          "ref": "bdc253cb96bdf7f4741d9bf87c4c6532967ffdb3"
        }
      ]
    },
    {
      "id": "bailicangdu-vue2-manage",
      "path": "bailicangdu-vue2-manage",
      "license": "GPL-2.0-only",
      "source": {
        "name": "bailicangdu/vue2-manage",
        "version": "dca263e3a8411ec47b5814a01470162d907d6964",
        "url": "https://github.com/bailicangdu/vue2-manage",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bailicangdu/vue2-manage/license?ref=dca263e3a8411ec47b5814a01470162d907d6964",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/bailicangdu/vue2-manage.git",
          "revision": "dca263e3a8411ec47b5814a01470162d907d6964",
          "ref": "dca263e3a8411ec47b5814a01470162d907d6964"
        }
      ]
    },
    {
      "id": "jonas-tig",
      "path": "jonas-tig",
      "license": "GPL-2.0-only",
      "source": {
        "name": "jonas/tig",
        "version": "1b86f070a1f6d4c686a09b997fd4249d52a2a272",
        "url": "https://github.com/jonas/tig",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/jonas/tig/license?ref=1b86f070a1f6d4c686a09b997fd4249d52a2a272",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/jonas/tig.git",
          "revision": "1b86f070a1f6d4c686a09b997fd4249d52a2a272",
          "ref": "1b86f070a1f6d4c686a09b997fd4249d52a2a272"
        }
      ]
    },
    {
      "id": "autohotkey-autohotkey",
      "path": "autohotkey-autohotkey",
      "license": "GPL-2.0-only",
      "source": {
        "name": "AutoHotkey/AutoHotkey",
        "version": "34b170115414dd69f1dfaf54893c150deade6bd2",
        "url": "https://github.com/AutoHotkey/AutoHotkey",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/AutoHotkey/AutoHotkey/license?ref=34b170115414dd69f1dfaf54893c150deade6bd2",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/AutoHotkey/AutoHotkey.git",
          "revision": "34b170115414dd69f1dfaf54893c150deade6bd2",
          "ref": "34b170115414dd69f1dfaf54893c150deade6bd2"
        }
      ]
    },
    {
      "id": "stremio-stremio-web",
      "path": "stremio-stremio-web",
      "license": "GPL-2.0-only",
      "source": {
        "name": "Stremio/stremio-web",
        "version": "de0e1cdff7ab34c31a5e33fca19ad8de0ebba6e9",
        "url": "https://github.com/Stremio/stremio-web",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Stremio/stremio-web/license?ref=de0e1cdff7ab34c31a5e33fca19ad8de0ebba6e9",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/Stremio/stremio-web.git",
          "revision": "de0e1cdff7ab34c31a5e33fca19ad8de0ebba6e9",
          "ref": "de0e1cdff7ab34c31a5e33fca19ad8de0ebba6e9"
        }
      ]
    },
    {
      "id": "automattic-wp-calypso",
      "path": "automattic-wp-calypso",
      "license": "GPL-2.0-only",
      "source": {
        "name": "Automattic/wp-calypso",
        "version": "329b3647ba759c0a8f3e5034aee5e83c861cab54",
        "url": "https://github.com/Automattic/wp-calypso",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/Automattic/wp-calypso/license?ref=329b3647ba759c0a8f3e5034aee5e83c861cab54",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/Automattic/wp-calypso.git",
          "revision": "329b3647ba759c0a8f3e5034aee5e83c861cab54",
          "ref": "329b3647ba759c0a8f3e5034aee5e83c861cab54"
        }
      ]
    },
    {
      "id": "secdev-scapy",
      "path": "secdev-scapy",
      "license": "GPL-2.0-only",
      "source": {
        "name": "secdev/scapy",
        "version": "d8f7b272b1eb3e989920ba2a84bbae1a847660bd",
        "url": "https://github.com/secdev/scapy",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/secdev/scapy/license?ref=d8f7b272b1eb3e989920ba2a84bbae1a847660bd",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/secdev/scapy.git",
          "revision": "d8f7b272b1eb3e989920ba2a84bbae1a847660bd",
          "ref": "d8f7b272b1eb3e989920ba2a84bbae1a847660bd"
        }
      ]
    },
    {
      "id": "typecho-typecho",
      "path": "typecho-typecho",
      "license": "GPL-2.0-only",
      "source": {
        "name": "typecho/typecho",
        "version": "56f4c6f33955a87969c399b5d5912d7f9fd7347c",
        "url": "https://github.com/typecho/typecho",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/typecho/typecho/license?ref=56f4c6f33955a87969c399b5d5912d7f9fd7347c",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/typecho/typecho.git",
          "revision": "56f4c6f33955a87969c399b5d5912d7f9fd7347c",
          "ref": "56f4c6f33955a87969c399b5d5912d7f9fd7347c"
        }
      ]
    },
    {
      "id": "bailicangdu-node-elm",
      "path": "bailicangdu-node-elm",
      "license": "GPL-2.0-only",
      "source": {
        "name": "bailicangdu/node-elm",
        "version": "32ea999c63f59db4f6fb05e3227bc305663782f0",
        "url": "https://github.com/bailicangdu/node-elm",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/bailicangdu/node-elm/license?ref=32ea999c63f59db4f6fb05e3227bc305663782f0",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/bailicangdu/node-elm.git",
          "revision": "32ea999c63f59db4f6fb05e3227bc305663782f0",
          "ref": "32ea999c63f59db4f6fb05e3227bc305663782f0"
        }
      ]
    },
    {
      "id": "daybreak-u-chineseocr_lite",
      "path": "daybreak-u-chineseocr_lite",
      "license": "GPL-2.0-only",
      "source": {
        "name": "DayBreak-u/chineseocr_lite",
        "version": "54a3df53af823f3bffdde9393d0c021b4f6d94cd",
        "url": "https://github.com/DayBreak-u/chineseocr_lite",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/DayBreak-u/chineseocr_lite/license?ref=54a3df53af823f3bffdde9393d0c021b4f6d94cd",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/DayBreak-u/chineseocr_lite.git",
          "revision": "54a3df53af823f3bffdde9393d0c021b4f6d94cd",
          "ref": "54a3df53af823f3bffdde9393d0c021b4f6d94cd"
        }
      ]
    },
    {
      "id": "lostindark-driverstoreexplorer",
      "path": "lostindark-driverstoreexplorer",
      "license": "GPL-2.0-only",
      "source": {
        "name": "lostindark/DriverStoreExplorer",
        "version": "d983831f2838b2871255cd5e915dd1a5c07bb6c9",
        "url": "https://github.com/lostindark/DriverStoreExplorer",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/lostindark/DriverStoreExplorer/license?ref=d983831f2838b2871255cd5e915dd1a5c07bb6c9",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/lostindark/DriverStoreExplorer.git",
          "revision": "d983831f2838b2871255cd5e915dd1a5c07bb6c9",
          "ref": "d983831f2838b2871255cd5e915dd1a5c07bb6c9"
        }
      ]
    },
    {
      "id": "mremoteng-mremoteng",
      "path": "mremoteng-mremoteng",
      "license": "GPL-2.0-only",
      "source": {
        "name": "mRemoteNG/mRemoteNG",
        "version": "87ebe87ad735f9bfd0578e2d4d3e4c71ec1ad007",
        "url": "https://github.com/mRemoteNG/mRemoteNG",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/mRemoteNG/mRemoteNG/license?ref=87ebe87ad735f9bfd0578e2d4d3e4c71ec1ad007",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/mRemoteNG/mRemoteNG.git",
          "revision": "87ebe87ad735f9bfd0578e2d4d3e4c71ec1ad007",
          "ref": "87ebe87ad735f9bfd0578e2d4d3e4c71ec1ad007"
        }
      ]
    },
    {
      "id": "aboul3la-sublist3r",
      "path": "aboul3la-sublist3r",
      "license": "GPL-2.0-only",
      "source": {
        "name": "aboul3la/Sublist3r",
        "version": "729d649ec5370730172bf6f5314aafd68c874124",
        "url": "https://github.com/aboul3la/Sublist3r",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/aboul3la/Sublist3r/license?ref=729d649ec5370730172bf6f5314aafd68c874124",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/aboul3la/Sublist3r.git",
          "revision": "729d649ec5370730172bf6f5314aafd68c874124",
          "ref": "729d649ec5370730172bf6f5314aafd68c874124"
        }
      ]
    },
    {
      "id": "trinitycore-trinitycore",
      "path": "trinitycore-trinitycore",
      "license": "GPL-2.0-only",
      "source": {
        "name": "TrinityCore/TrinityCore",
        "version": "fcf3b8ec1c9bb4a20b491454df79d29c3ae4c165",
        "url": "https://github.com/TrinityCore/TrinityCore",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/TrinityCore/TrinityCore/license?ref=fcf3b8ec1c9bb4a20b491454df79d29c3ae4c165",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/TrinityCore/TrinityCore.git",
          "revision": "fcf3b8ec1c9bb4a20b491454df79d29c3ae4c165",
          "ref": "fcf3b8ec1c9bb4a20b491454df79d29c3ae4c165"
        }
      ]
    },
    {
      "id": "rofl0r-proxychains-ng",
      "path": "rofl0r-proxychains-ng",
      "license": "GPL-2.0-only",
      "source": {
        "name": "rofl0r/proxychains-ng",
        "version": "e6313ce408645b70b60881130fb2dae9c538b306",
        "url": "https://github.com/rofl0r/proxychains-ng",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/rofl0r/proxychains-ng/license?ref=e6313ce408645b70b60881130fb2dae9c538b306",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/rofl0r/proxychains-ng.git",
          "revision": "e6313ce408645b70b60881130fb2dae9c538b306",
          "ref": "e6313ce408645b70b60881130fb2dae9c538b306"
        }
      ]
    },
    {
      "id": "taojy123-keymousego",
      "path": "taojy123-keymousego",
      "license": "GPL-2.0-only",
      "source": {
        "name": "taojy123/KeymouseGo",
        "version": "49577ed0877a0739eef84b2d09f95fca1bbbb416",
        "url": "https://github.com/taojy123/KeymouseGo",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/taojy123/KeymouseGo/license?ref=49577ed0877a0739eef84b2d09f95fca1bbbb416",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/taojy123/KeymouseGo.git",
          "revision": "49577ed0877a0739eef84b2d09f95fca1bbbb416",
          "ref": "49577ed0877a0739eef84b2d09f95fca1bbbb416"
        }
      ]
    },
    {
      "id": "lmms-lmms",
      "path": "lmms-lmms",
      "license": "GPL-2.0-only",
      "source": {
        "name": "LMMS/lmms",
        "version": "067c3ad4124af9114d8aa186923550e51e1b8e5a",
        "url": "https://github.com/LMMS/lmms",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/LMMS/lmms/license?ref=067c3ad4124af9114d8aa186923550e51e1b8e5a",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/LMMS/lmms.git",
          "revision": "067c3ad4124af9114d8aa186923550e51e1b8e5a",
          "ref": "067c3ad4124af9114d8aa186923550e51e1b8e5a"
        }
      ]
    },
    {
      "id": "s3fs-fuse-s3fs-fuse",
      "path": "s3fs-fuse-s3fs-fuse",
      "license": "GPL-2.0-only",
      "source": {
        "name": "s3fs-fuse/s3fs-fuse",
        "version": "c12124a4e1194375511efb35c04d473b26b7f853",
        "url": "https://github.com/s3fs-fuse/s3fs-fuse",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://api.github.com/repos/s3fs-fuse/s3fs-fuse/license?ref=c12124a4e1194375511efb35c04d473b26b7f853",
          "declaration": "GPL-2.0-only"
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
          "url": "https://github.com/s3fs-fuse/s3fs-fuse.git",
          "revision": "c12124a4e1194375511efb35c04d473b26b7f853",
          "ref": "c12124a4e1194375511efb35c04d473b26b7f853"
        }
      ]
    },
    {
      "id": "gnu-bash",
      "path": "gnu-bash",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/bash",
        "version": "b460816602167718f78a6233164e8875f49b75b2",
        "url": "https://git.savannah.gnu.org/cgit/bash.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/bash.git/tree/COPYING?id=b460816602167718f78a6233164e8875f49b75b2",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/bash.git",
          "revision": "b460816602167718f78a6233164e8875f49b75b2",
          "ref": "b460816602167718f78a6233164e8875f49b75b2"
        }
      ]
    },
    {
      "id": "gnu-coreutils",
      "path": "gnu-coreutils",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/coreutils",
        "version": "786488adef22c477d8e3c8b562f9c4cb02288014",
        "url": "https://git.savannah.gnu.org/cgit/coreutils.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/coreutils.git/tree/COPYING?id=786488adef22c477d8e3c8b562f9c4cb02288014",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/coreutils.git",
          "revision": "786488adef22c477d8e3c8b562f9c4cb02288014",
          "ref": "786488adef22c477d8e3c8b562f9c4cb02288014"
        }
      ]
    },
    {
      "id": "gnu-diffutils",
      "path": "gnu-diffutils",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/diffutils",
        "version": "ba490bf17c1938e7cd0c2309a08d9a59b962bdff",
        "url": "https://git.savannah.gnu.org/cgit/diffutils.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/diffutils.git/tree/COPYING?id=ba490bf17c1938e7cd0c2309a08d9a59b962bdff",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/diffutils.git",
          "revision": "ba490bf17c1938e7cd0c2309a08d9a59b962bdff",
          "ref": "ba490bf17c1938e7cd0c2309a08d9a59b962bdff"
        }
      ]
    },
    {
      "id": "gnu-emacs",
      "path": "gnu-emacs",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/emacs",
        "version": "b157d8e96a26e7509136bf93fad2c7ec49c0ee88",
        "url": "https://git.savannah.gnu.org/cgit/emacs.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/emacs.git/tree/COPYING?id=b157d8e96a26e7509136bf93fad2c7ec49c0ee88",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/emacs.git",
          "revision": "b157d8e96a26e7509136bf93fad2c7ec49c0ee88",
          "ref": "b157d8e96a26e7509136bf93fad2c7ec49c0ee88"
        }
      ]
    },
    {
      "id": "gnu-findutils",
      "path": "gnu-findutils",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/findutils",
        "version": "eaa3ba5a63b569dbf1a4b1389963f734ebe7edd3",
        "url": "https://git.savannah.gnu.org/cgit/findutils.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/findutils.git/tree/COPYING?id=eaa3ba5a63b569dbf1a4b1389963f734ebe7edd3",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/findutils.git",
          "revision": "eaa3ba5a63b569dbf1a4b1389963f734ebe7edd3",
          "ref": "eaa3ba5a63b569dbf1a4b1389963f734ebe7edd3"
        }
      ]
    },
    {
      "id": "gnu-gawk",
      "path": "gnu-gawk",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/gawk",
        "version": "65929a5cdba54e1e044c91218b0dd845bf50455a",
        "url": "https://git.savannah.gnu.org/cgit/gawk.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/gawk.git/tree/COPYING?id=65929a5cdba54e1e044c91218b0dd845bf50455a",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/gawk.git",
          "revision": "65929a5cdba54e1e044c91218b0dd845bf50455a",
          "ref": "65929a5cdba54e1e044c91218b0dd845bf50455a"
        }
      ]
    },
    {
      "id": "gnu-grep",
      "path": "gnu-grep",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/grep",
        "version": "79da8e07613966b9e53c7ef31b4765d39f98044d",
        "url": "https://git.savannah.gnu.org/cgit/grep.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/grep.git/tree/COPYING?id=79da8e07613966b9e53c7ef31b4765d39f98044d",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/grep.git",
          "revision": "79da8e07613966b9e53c7ef31b4765d39f98044d",
          "ref": "79da8e07613966b9e53c7ef31b4765d39f98044d"
        }
      ]
    },
    {
      "id": "gnu-gzip",
      "path": "gnu-gzip",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/gzip",
        "version": "5f62db44b781b01a3d6d8436babcf8113f32efd2",
        "url": "https://git.savannah.gnu.org/cgit/gzip.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/gzip.git/tree/COPYING?id=5f62db44b781b01a3d6d8436babcf8113f32efd2",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/gzip.git",
          "revision": "5f62db44b781b01a3d6d8436babcf8113f32efd2",
          "ref": "5f62db44b781b01a3d6d8436babcf8113f32efd2"
        }
      ]
    },
    {
      "id": "gnu-make",
      "path": "gnu-make",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/make",
        "version": "b3802782de3eff2c0f1eda9e7c0befd8cd142162",
        "url": "https://git.savannah.gnu.org/cgit/make.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/make.git/tree/COPYING?id=b3802782de3eff2c0f1eda9e7c0befd8cd142162",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/make.git",
          "revision": "b3802782de3eff2c0f1eda9e7c0befd8cd142162",
          "ref": "b3802782de3eff2c0f1eda9e7c0befd8cd142162"
        }
      ]
    },
    {
      "id": "gnu-nano",
      "path": "gnu-nano",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/nano",
        "version": "8e6360d1663998c62ddd0cf934923d1f18004e3e",
        "url": "https://git.savannah.gnu.org/cgit/nano.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/nano.git/tree/COPYING?id=8e6360d1663998c62ddd0cf934923d1f18004e3e",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/nano.git",
          "revision": "8e6360d1663998c62ddd0cf934923d1f18004e3e",
          "ref": "8e6360d1663998c62ddd0cf934923d1f18004e3e"
        }
      ]
    },
    {
      "id": "gnu-patch",
      "path": "gnu-patch",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/patch",
        "version": "a2b192295d7046bafc18d54973436bb3faa659d7",
        "url": "https://git.savannah.gnu.org/cgit/patch.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/patch.git/tree/COPYING?id=a2b192295d7046bafc18d54973436bb3faa659d7",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/patch.git",
          "revision": "a2b192295d7046bafc18d54973436bb3faa659d7",
          "ref": "a2b192295d7046bafc18d54973436bb3faa659d7"
        }
      ]
    },
    {
      "id": "gnu-sed",
      "path": "gnu-sed",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/sed",
        "version": "31df9f71cb62e423311985b3bf352ee84c4a9e54",
        "url": "https://git.savannah.gnu.org/cgit/sed.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/sed.git/tree/COPYING?id=31df9f71cb62e423311985b3bf352ee84c4a9e54",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/sed.git",
          "revision": "31df9f71cb62e423311985b3bf352ee84c4a9e54",
          "ref": "31df9f71cb62e423311985b3bf352ee84c4a9e54"
        }
      ]
    },
    {
      "id": "gnu-tar",
      "path": "gnu-tar",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/tar",
        "version": "d1df7f403de05bfbe11527a5b570469fb1011fda",
        "url": "https://git.savannah.gnu.org/cgit/tar.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/tar.git/tree/COPYING?id=d1df7f403de05bfbe11527a5b570469fb1011fda",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/tar.git",
          "revision": "d1df7f403de05bfbe11527a5b570469fb1011fda",
          "ref": "d1df7f403de05bfbe11527a5b570469fb1011fda"
        }
      ]
    },
    {
      "id": "gnu-wget",
      "path": "gnu-wget",
      "license": "GPL-3.0-or-later",
      "source": {
        "name": "gnu/wget",
        "version": "705e9e3a749f9f0430c1fad9892227c210c66dee",
        "url": "https://git.savannah.gnu.org/cgit/wget.git",
        "category": "public-dataset",
        "license_evidence": {
          "url": "https://git.savannah.gnu.org/cgit/wget.git/tree/COPYING?id=705e9e3a749f9f0430c1fad9892227c210c66dee",
          "declaration": "GPL-3.0-or-later"
        },
        "content": {
          "types": [
            "source code"
          ],
          "languages": [
            "C"
          ],
          "selection": "Tracked GNU project files selected by the reviewed --source-code profile; text, structured, and binary assets retained while common dependency, generated, fixture, and build-output trees are excluded.",
          "copyrighted": "yes"
        },
        "acquisition": {
          "basis": "Official public GNU Git repository at the pinned commit."
        }
      },
      "input": {
        "type": "auto"
      },
      "artifacts": [
        {
          "url": "https://git.savannah.gnu.org/git/wget.git",
          "revision": "705e9e3a749f9f0430c1fad9892227c210c66dee",
          "ref": "705e9e3a749f9f0430c1fad9892227c210c66dee"
        }
      ]
    }
  ]
}
JSON
