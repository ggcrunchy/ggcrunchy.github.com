"use strict";(self.webpackChunkggcrunchy_docs=self.webpackChunkggcrunchy_docs||[]).push([[1873],{2330:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>l,contentTitle:()=>o,default:()=>a,frontMatter:()=>i,metadata:()=>c,toc:()=>d});var s=n(4848),r=n(8453);const i={sidebar_position:23},o=void 0,c={id:"plugins/list/webp",title:"webp",description:"It does some pretty weird stuff with a custom Bytemap loader. Not sure if doc'd.",source:"@site/docs/plugins/list/webp.md",sourceDirName:"plugins/list",slug:"/plugins/list/webp",permalink:"/docs/plugins/list/webp",draft:!1,unlisted:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/plugins/list/webp.md",tags:[],version:"current",sidebarPosition:23,frontMatter:{sidebar_position:23},sidebar:"pluginsSidebar",previous:{title:"truetype",permalink:"/docs/plugins/list/truetype"},next:{title:"wfc",permalink:"/docs/plugins/list/wfc"}},l={},d=[];function p(e){const t={code:"code",li:"li",p:"p",pre:"pre",ul:"ul",...(0,r.R)(),...e.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsx)(t.p,{children:"It does some pretty weird stuff with a custom Bytemap loader. Not sure if doc'd."}),"\n",(0,s.jsx)(t.p,{children:"ByteReader stuff."}),"\n",(0,s.jsx)(t.p,{children:"Was kind of a special-purpose thing. Probably better to defer to Ansh3ll's."}),"\n",(0,s.jsxs)(t.ul,{children:["\n",(0,s.jsx)(t.li,{children:"COLORSPACE:"}),"\n"]}),"\n",(0,s.jsx)(t.pre,{children:(0,s.jsx)(t.code,{children:'\t"RGB", "RGBA", "BGR", "BGRA", "ARGB", "rgbA" (default), "bgrA", "Argb"\n'})}),"\n",(0,s.jsxs)(t.ul,{children:["\n",(0,s.jsx)(t.li,{children:"OPTIONS:"}),"\n"]}),"\n",(0,s.jsx)(t.pre,{children:(0,s.jsx)(t.code,{children:'    "bypass_filtering", "flip", "no_fancy_upsampling", "use_cropping", "use_scaling", "use_threads" -- booleans\n    "crop_left", "crop_top", -- non-negative\n    "crop_width", "crop_height", "scaled_width", "scaled_height" -- positive\n    "dithering_strength", "alpha_dithering_strength" -- percentages\n'})}),"\n",(0,s.jsxs)(t.ul,{children:["\n",(0,s.jsx)(t.li,{children:"FUNCS:"}),"\n"]}),"\n",(0,s.jsx)(t.pre,{children:(0,s.jsx)(t.code,{children:'\tnil, w[, h] = GetInfoFromMemory(bytes)\n\n\tloader = GetLoader() -- for use with Bytemap (TODO?), uses config at start\n\t\n\tUpdateConfig(name, value) -- name from OPTIONS, or "colorspace"\n\tUpdateConfig(options) -- from list\n'})})]})}function a(e={}){const{wrapper:t}={...(0,r.R)(),...e.components};return t?(0,s.jsx)(t,{...e,children:(0,s.jsx)(p,{...e})}):p(e)}},8453:(e,t,n)=>{n.d(t,{R:()=>o,x:()=>c});var s=n(6540);const r={},i=s.createContext(r);function o(e){const t=s.useContext(i);return s.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function c(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:o(e.components),s.createElement(i.Provider,{value:t},e.children)}}}]);