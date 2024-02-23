"use strict";(self.webpackChunkggcrunchy_docs=self.webpackChunkggcrunchy_docs||[]).push([[3370],{3423:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>i,contentTitle:()=>s,default:()=>u,frontMatter:()=>r,metadata:()=>c,toc:()=>l});var o=n(4848),d=n(8453);const r={sidebar_position:3},s=void 0,c={id:"plugins/other/tinyrenderer",title:"tinyrenderer",description:"- FUNCS",source:"@site/docs/plugins/other/tinyrenderer.md",sourceDirName:"plugins/other",slug:"/plugins/other/tinyrenderer",permalink:"/docs/plugins/other/tinyrenderer",draft:!1,unlisted:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/plugins/other/tinyrenderer.md",tags:[],version:"current",sidebarPosition:3,frontMatter:{sidebar_position:3},sidebar:"pluginsSidebar",previous:{title:"theora",permalink:"/docs/plugins/other/theora"},next:{title:"Markdown Features",permalink:"/docs/plugins/other/markdown-features"}},i={},l=[];function a(e){const t={code:"code",li:"li",pre:"pre",ul:"ul",...(0,d.R)(),...e.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsx)(t.li,{children:"FUNCS"}),"\n"]}),"\n",(0,o.jsx)(t.pre,{children:(0,o.jsx)(t.code,{children:"\t\tfloat_texture = NewFloatTexture()\n\t\tmodel = NewModel()\n\t\tnode = NewNode()\n\t\tobject = NewObject(model)\n\t\tscene = NewScene(width, height[, options])\n\t\t\n\t\t\t-- has_alpha, using_blob (booleans)\n\t\t\n\t\ttexture = NewTexture()\n"})}),"\n",(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsx)(t.li,{children:"METHODS"}),"\n"]}),"\n",(0,o.jsx)(t.pre,{children:(0,o.jsx)(t.code,{children:"\t\tfloat_texture:Bind (data, w, h[, comps]) -- data = floats; default comps = 3\n\n\t\tmodel:AddFace(index1, index2, index3) -- 1-based\n        model:AddNormal(x, y, z)\n        model:AddUV(u, v)\n        model:AddVertex(x, y, z)\n        \n\t\tindex1, index2, index3 = model:GetFaceVertexIndices(face_index)\n\t\tx, y, z = model:GetVertex(index)\n\t\t\n\t\tface_count = #model\n        \n\t\tmodel:SetDiffuse(texture)\n        model:SetNormalMap(float_texture)\n\n\t\tobject / nil = node:GetObject(index)\n\t\tnode / nil = node:GetSubnode(index)\n        \n\t\tcount = node:GetObjectCount()\n\t\tnode / nil = node:GetParent()\n\t\tcount = node:GetSubnodeCount()\n\n\t\tnode:Insert(object)\n\t\tnode:Insert(node)\n\n\t\tis_destroyed = node:IsDestroyed()\n\n\t\tobject_count + subnode_count = #node\n \n\t\tnode:SetPosition(x, y, z)\n\t\tnode:SetPosition(bytes)\n\t\tnode:SetRotation(x, y, z, w)\n\t\tnode:SetRotation(bytes)\n\t\tnode:SetScale(x, y, z)\n\t\tnode:SetScale(bytes)\n\n        object:DetachSelf()\n\n\t\t-- TODO: object:Destroy()?\n\n\t\tnode = object:GetParent()\n\n\t\tobject:SetDiffuse(texture / nil)\n\t\tobject:SetNormal(float_texture / nil)\n\t\t\n\t\tobject:SetPosition(x, y, z)\n\t\tobject:SetPosition(bytes)\n\t\tobject:SetScale(x, y, z)\n\t\tobject:SetScale(bytes)\n\n\t\tnode:Destroy()\n\t\tnode:DetachObject(index)\n\t\tnode:DetachSelf()\n\t\tnode:DetachSubnode(index)\n\n\t    scene:Clear()\n\t\t\n\t\tblob / nil = scene:GetBlob()\n        bytes = scene:GetBytes()\n\n\t\tt / nil[, r[, g[, b[, a]]]] = scene:GetHitColor(object, face, ex, ey, ez, cx, cy, cz) -- not sure if useful\n\n\t\tnode = scene:GetRoot()\n\n\t\tscene:Render()\n\t\tscene:SetCenter(x, y, z)\n\t\tscene:SetEye(x, y, z)\n\t\tscene:SetLightDir(x, y, z)\n\t\tscene:SetUp(x, y, z)\n\n\t\ttexture:Bind (data, w, h[, comps]) -- data = unsigned char; default comps = 3\n"})})]})}function u(e={}){const{wrapper:t}={...(0,d.R)(),...e.components};return t?(0,o.jsx)(t,{...e,children:(0,o.jsx)(a,{...e})}):a(e)}},8453:(e,t,n)=>{n.d(t,{R:()=>s,x:()=>c});var o=n(6540);const d={},r=o.createContext(d);function s(e){const t=o.useContext(r);return o.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function c(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(d):e.components||d:s(e.components),o.createElement(r.Provider,{value:t},e.children)}}}]);