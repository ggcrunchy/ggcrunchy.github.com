"use strict";(self.webpackChunkggcrunchy_docs=self.webpackChunkggcrunchy_docs||[]).push([[2145],{1864:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>d,contentTitle:()=>o,default:()=>l,frontMatter:()=>r,metadata:()=>c,toc:()=>u});var s=t(4848),i=t(8453);const r={sidebar_position:14},o=void 0,c={id:"plugins/list/octasphere",title:"octasphere",description:"- CONFIG:",source:"@site/docs/plugins/list/octasphere.md",sourceDirName:"plugins/list",slug:"/plugins/list/octasphere",permalink:"/projects/site2/docs/plugins/list/octasphere",draft:!1,unlisted:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/plugins/list/octasphere.md",tags:[],version:"current",sidebarPosition:14,frontMatter:{sidebar_position:14},sidebar:"pluginsSidebar",previous:{title:"mwc",permalink:"/projects/site2/docs/plugins/list/mwc"},next:{title:"parshapes",permalink:"/projects/site2/docs/plugins/list/parshapes"}},d={},u=[];function a(e){const n={code:"code",li:"li",pre:"pre",ul:"ul",...(0,i.R)(),...e.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:"CONFIG:"}),"\n"]}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{children:'    lua_getfield(L, 1, "corner_radius"); // params, corner_radius\n    lua_getfield(L, 1, "width"); // params, corner_radius, width\n    lua_getfield(L, 1, "height"); // params, corner_radius, width, height\n    lua_getfield(L, 1, "depth"); // params, corner_radius, width, height, depth\n    lua_getfield(L, 1, "num_subdivisions"); // params, corner_radius, width, height, depth, num_subdivisions\n\n    config.num_subdivisions = luaL_optinteger(L, -1, 3);\n    config.depth = (float)luaL_optnumber(L, -2, 15);\n    config.height = (float)luaL_optnumber(L, -3, 100);\n    config.width = (float)luaL_optnumber(L, -4, 100);\n    config.corner_radius = (float)luaL_optnumber(L, -5, 5);\n'})}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:"FUNCS:"}),"\n"]}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{children:"    num_indices, num_verts = get_counts(CONFIG)\n\t\n\tmesh = populate(CONFIG)\n"})}),"\n",(0,s.jsxs)(n.ul,{children:["\n",(0,s.jsx)(n.li,{children:"METHODS:"}),"\n"]}),"\n",(0,s.jsx)(n.pre,{children:(0,s.jsx)(n.code,{children:"\t\t    index = mesh:get_index(index) -- 1-based\n\t\t\tx, y, z = mesh:get_normal(index)\n            x, y, z = mesh:get_position(index)\n            u, v = mesh:get_texcoord(index)\n            count = mesh:get_vertex_count()\n"})})]})}function l(e={}){const{wrapper:n}={...(0,i.R)(),...e.components};return n?(0,s.jsx)(n,{...e,children:(0,s.jsx)(a,{...e})}):a(e)}},8453:(e,n,t)=>{t.d(n,{R:()=>o,x:()=>c});var s=t(6540);const i={},r=s.createContext(i);function o(e){const n=s.useContext(r);return s.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function c(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:o(e.components),s.createElement(r.Provider,{value:n},e.children)}}}]);