"use strict";(self.webpackChunkggcrunchy_docs=self.webpackChunkggcrunchy_docs||[]).push([[8656],{2e3:(t,e,n)=>{n.r(e),n.d(e,{assets:()=>d,contentTitle:()=>i,default:()=>v,frontMatter:()=>o,metadata:()=>c,toc:()=>p});var s=n(4848),a=n(8453);const o={sidebar_position:26},i=void 0,c={id:"plugins/list/yoctoshapes",title:"yoctoshapes",description:"Mostly follows original API.",source:"@site/docs/plugins/list/yoctoshapes.md",sourceDirName:"plugins/list",slug:"/plugins/list/yoctoshapes",permalink:"/docs/plugins/list/yoctoshapes",draft:!1,unlisted:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/plugins/list/yoctoshapes.md",tags:[],version:"current",sidebarPosition:26,frontMatter:{sidebar_position:26},sidebar:"pluginsSidebar",previous:{title:"winmisc",permalink:"/docs/plugins/list/winmisc"},next:{title:"Works in Progress",permalink:"/docs/category/works-in-progress"}},d={},p=[];function r(t){const e={code:"code",li:"li",p:"p",pre:"pre",ul:"ul",...(0,a.R)(),...t.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsx)(e.p,{children:"Mostly follows original API."}),"\n",(0,s.jsx)(e.p,{children:"ByteReader?"}),"\n",(0,s.jsxs)(e.ul,{children:["\n",(0,s.jsx)(e.li,{children:"FUNCS:"}),"\n"]}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:"        shape_data = make_bent_floor(opts)\n\n                yocto::vec2f scale = {10, 10}, uvscale = {10, 10};\n                yocto::vec2i steps = {1, 1};\n                float bent = 0.5f;\n\n\t\tshape_data = make_box(opts)\n\n                yocto::vec3f scale = {1, 1, 1}, uvscale = {1, 1, 1};\n                yocto::vec3i steps = {1, 1, 1};\n\t\tshape_data = make_bulged_disk(opts)\n\n                float scale = 1, uvscale = 1, height = 0.3f;\n                int steps = 32;\n\n        shape_data = make_bulged_rect(opts)\n\n                yocto::vec2f scale = {1, 1}, uvscale = {1, 1};\n                yocto::vec2i steps = {1, 1};\n                float radius = 0.3f;\n\n        shape_data = make_bulged_recty(opts)\n\n                yocto::vec2f scale = {1, 1}, uvscale = {1, 1};\n                yocto::vec2i steps = {1, 1};\n                float radius = 0.3f;\n\n        shape_data = make_capped_uvsphere(opts)\n\n                yocto::vec2i steps = {32, 32};\n                yocto::vec2f uvscale = {1, 1};\n                float scale = 1, height = 0.3f;\n\n        shape_data = make_capped_uvspherey(opts)\n\n                yocto::vec2i steps = {32, 32};\n                yocto::vec2f uvscale = {1, 1};\n                float scale = 1, height = 0.3f;\n\n        shape_data = make_cube(opts)\n\n                float scale = 1;\n                int subdivisions = 0;\n\n        shape_data = make_disk(opts)\n\n                float scale = 1, uvscale = 1;\n                int steps = 0;\n\n        shape_data = make_floor(opts)\n\n                yocto::vec2i steps = {1, 1};\n                yocto::vec2f scale = {10, 10}, uvscale = {10, 10};\n\n        fvshape_data = make_fvbox(opts)\n\n                yocto::vec3i steps = {1, 1, 1};\n                yocto::vec3f scale = {1, 1, 1}, uvscale = {1, 1, 1};\n\n        fvshape_data = make_fvcube(opts)\n\n                float scale = 1;\n                int subdivisions = 0;\n\n        fvshape_data = make_fvrect(opts)\n\n                yocto::vec2i steps = {1, 1};\n                yocto::vec2f scale = {1, 1}, uvscale = {1, 1};\n\n        fvshape_data = make_fvsphere(opts)\n\n                float scale = 1, uvscale = 1;\n                int steps = 32;\n\n        shape_data = make_geosphere(opts)\n\n                float scale = 1;\n                int subdivisions = 0;\n\n        shape_data = make_lines(opts)\n\n                yocto::vec2i steps = {4, 65536};\n                yocto::vec2f scale = {1, 1}, uvscale = {1, 1}, radius = {0.001f, 0.001f};\n\n        shape_data = make_monkey(opts)\n\n                float scale = 1;\n                int subdivisions = 0;\n\n        shape_data = make_point(opts)\n\n                float radius = 0.001f;\n\n        shape_data = make_points(opts)\n\n                float uvscale = 1, radius = 0.001f;\n                int num = 65536;\n\n        shape_data = make_points2(opts)\n\n                yocto::vec2i steps = {256, 256};\n                yocto::vec2f size = {1, 1}, uvscale = {1, 1}, radius = {0.001f, 0.001f};\n\n        shape_data = make_quad(opts)\n\n                float scale = 1;\n                int subdivisions = 0;\n\n        shape_data = make_quady(opts)\n\n                float scale = 1;\n                int subdivisions = 0;\n\n        shape_data = make_random_points(opts)\n\n                yocto::vec3f size = {1, 1, 1};\n                float uvscale = 1, radius = 0.001f;\n                int num = 65536;\n                uint64_t seed = 17;\n\n        shape_data = make_rect(opts)\n\n                yocto::vec2i steps = {1, 1};\n                yocto::vec2f scale = {1, 1}, uvscale = {1, 1};\n\n        shape_data = make_rect_stack(opts)\n\n                yocto::vec2f uvscale = {1, 1};\n                yocto::vec3i steps = {1, 1, 1};\n                yocto::vec3f scale = {1, 1, 1};\n\n        shape_data = make_recty(opts)\n\n                yocto::vec2i steps = {1, 1};\n                yocto::vec2f scale = {1, 1}, uvscale = {1, 1};\n\n        shape_data = make_rounded_box(opts)\n\n                yocto::vec3i steps = {1, 1, 1};\n                yocto::vec3f scale = {1, 1, 1}, uvscale = {1, 1, 1};\n                float radius = 0.3f;\n\n        shape_data = make_rounded_uvcylinder(opts)\n                \n                yocto::vec2f scale = {1, 1};\n                yocto::vec3f uvscale = {1, 1, 1};\n                yocto::vec3i steps = {32, 32, 32};\n                float radius = 0.3f;\n\n        shape_data = make_sphere(opts)\n\n                float scale = 1, uvscale = 1;\n                int steps = 32;\n\n        shape_data = make_uvcylinder(opts)\n                \n                yocto::vec2f scale = {1, 1};\n                yocto::vec3f uvscale = {1, 1, 1};\n                yocto::vec3i steps = {32, 32, 32};\n\n        shape_data = make_uvdisk(opts)\n\n                yocto::vec2i steps = {1, 1};\n                yocto::vec2f uvscale = {1, 1};\n                float scale = 1;\n\n        shape_data = make_uvsphere(opts)\n\n                yocto::vec2i steps = {1, 1};\n                yocto::vec2f uvscale = {1, 1};\n                float scale = 1;\n\n        shape_data = make_uvspherey(opts)\n\n                yocto::vec2i steps = {1, 1};\n                yocto::vec2f uvscale = {1, 1};\n                float scale = 1;\n"})}),"\n",(0,s.jsxs)(e.ul,{children:["\n",(0,s.jsx)(e.li,{children:"METHODS:"}),"\n"]}),"\n",(0,s.jsx)(e.pre,{children:(0,s.jsx)(e.code,{children:'\t\t\t- shape_data:\n\t\t\t\n\t\t\t\tshape_data:compute_normals(normals) -- vec3f\n\t\t\t\tnormals = shape_data:compute_normals()\n\t\t\t\t\n\t\t\t\tcolor = shape_data:eval_color(element, uv[, color]) -- element = 1-based index, uv = {u,v} (array), color = {r,g,b,a} (array)\n\t\t\t\tnormal = shape_data:eval_element_normal(element[, normal]) -- normal = {x,y,z} (array)\n\t\t\t\tnormal = shape_data:eval_normal(element, uv[, normal])\n\t\t\t\tposition = shape_data:eval_position(element, uv[, position]) -- position = {x,y,z} (array)\n\t\t\t\tradius = shape_data:eval_radius(element, uv) -- radius = number\n\t\t\t\ttangent = shape_data:eval_tangent(element, uv[, tangent]) -- tangent = {x,y,z} (array)\n\t\t\t\ttexcoord = shape_data:eval_texcoord(element, uv[, texcoord]) -- texcoord = {u,v} (array)\n\t\t\t\t\n\t\t\t\tcolors = shape_data:get_colors() -- ref to vec4f\n\t\t\t\tlines = shape_data:get_lines() -- ref to vec2i\n\t\t\t\tnormals = shape_data:get_normals() -- ref to vec3f\n\t\t\t\tpoints = shape_data:get_points() -- ref to vec1i\n\t\t\t\tpositions = shape_data:get_positions() -- ref to vec3f\n\t\t\t\tquads = shape_data:get_quads() -- ref to vec4i\n\t\t\t\tradius = shape_data:get_radius() -- ref to vec1f\n\t\t\t\ttangents = shape_data:get_tangents() -- ref to vec4f\n\t\t\t\ttexcoords = shape_data:get_texcoords() -- ref to vec2f\n\t\t\t\ttriangles = shape_data:get_triangles() -- ref to vec3i\n\n\t\t\t\tshape_data = shape_data:make_hair(opts)\n\n\t\t\t\t\tyocto::vec2i steps = {8, 65536};\n\t\t\t\t\tyocto::vec2f length = {0.1f, 0.1f}, radius = {0.001f, 0.001f}, noise = {0, 10}, clump = {0, 128}, rotation = {0, 0};\n\t\t\t\t\tint seed = 7;\n\n\t\t\t\tshape_data = shape_data:make_hair2(opts)\n\n\t\t\t\t\tyocto::vec2i steps = {8, 65536};\n\t\t\t\t\tyocto::vec2f length = {0.1f, 0.1f}, radius = {0.001f, 0.001f};\n\t\t\t\t\tfloat noise = 0, gravity = 0.001f;\n\t\t\t\t\tint seed = 7;\n\n\t\t\t\tshape_data = shape_data:quads_to_triangles()\n\t\t\t\tshape_data:quads_to_triangles_inplace()\n\t\t\n\t\t\t\tpoints = shape_data:sample_shape(num_samples[, seed])\n\t\t\t\tpoint = shape_data:sample_shape(cdf, rn, ruv) -- vec1f, number, {x,y} (array)\n\t\t\t\tcdf = shape_data:sample_shape_cdf([cdf]) -- vec1f\n\n\t\t\t\tshape_data:set_colors(colors) -- vec4f\n\t\t\t\tshape_data:set_lines(lines) -- vec2i\n\t\t\t\tshape_data:set_normals(normals) -- vec3f\n\t\t\t\tshape_data:set_points(points) -- vec2i\n\t\t\t\tshape_data:set_positions(positions) -- vec3f\n\t\t\t\tshape_data:set_quads(quads) -- vec4i\n\t\t\t\tshape_data:set_radius(radius) -- vec1f\n\t\t\t\tshape_data:set_tangents(tangents) -- vec4f\n\t\t\t\tshape_data:set_texcoords(texcoords) -- vec2f\n\t\t\t\tshape_data:set_triangles(triangles) -- vec3i\n\n\t\t\t\t{ str1, str2, ... } = shape_data:shape_stats[, verbose] -- boolean\n\n\t\t\t\tfvshape_data shape_data:shape_to_fvshape()\n\t\t\t\t\n\t\t\t\tshape_data = shape_data:subdivide_shape(subdivisions, catmullclark) -- boolean\n\n\t\t\t- fvshape_data:\n\t\t\t\n\t\t\t\tfvshape_data:compute_normals(normals) -- vec3f\n\t\t\t\tnormals = fvshape_data:compute_normals()\n\t\t\t\t\n\t\t\t\tnormal = fvshape_data:eval_element_normal(element[, normal]) -- normal = {x,y,z} (array)\n\t\t\t\tnormal = fvshape_data:eval_normal(element, uv[, normal])\n\t\t\t\tposition = fvshape_data:eval_position(element, uv[, position]) -- position = {x,y,z} (array)\n\t\t\t\ttexcoord = fvshape_data:eval_texcoord(element, uv[, texcoord]) -- texcoord = {u,v} (array)\n\t\t\t\t\n\t\t\t\t{ str1, str2, ... } = fvshape_data:fvshape_stats[, verbose] -- boolean\n\n\t\t\t\tshape_data fvshape_data:fvshape_to_shape()\n\t\t\t\t\n\t\t\t\tnormals = fvshape_data:get_normals() -- ref to vec3f\n\t\t\t\tpositions = fvshape_data:get_positions() -- ref to vec3f\n\t\t\t\tquadsnorm = fvshape_data:get_quadsnorm() -- ref to vec4i\n\t\t\t\tquadspos = fvshape_data:get_quadspos() -- ref to vec4i\n\t\t\t\tquadstexcoord = fvshape_data:get_quadstexcoord() -- ref to vec4i\n\t\t\t\ttexcoords = shape_data:get_texcoords() -- ref to vec2f\n\n\t\t\t\tfvshape_data:set_normals(normals) -- vec3f\n\t\t\t\tfvshape_data:set_positions(positions) -- vec3f\n\t\t\t\tfvshape_data:set_quadsnorm(quads) -- vec4i\n\t\t\t\tfvshape_data:set_quadspos(quads) -- vec4i\n\t\t\t\tfvshape_data:set_quadstexcoord(quads) -- vec4i\n\t\t\t\tfvshape_data:set_texcoords(texcoords) -- vec2f\n\n\t\t\t\tfvshape_data = fvshape_data:subdivide_shape(subdivisions, catmullclark) -- boolean\n\t\t\t\n\t\t\t- vec1i:\n\t\t\t\n\t\t\t\tvec1i:append_point(index) -- 1-based\n\t\t\t\tveci1:update_point(vindex, index) -- ditto\n\t\t\t\n\t\t\t- vec2i:\n\t\t\t\n\t\t\t\tvec2i:append_line({index1, index2}) -- array, 1-based\n\t\t\t\tvec2i:append_line(index1, index2)\n\n\t\t\t\tvec2i:lines_tangents(positions, tangents) -- vec3f\n\t\t\t\ttangents = vec2i:lines_tangents(positions)\n\n\t\t\t\tvec2i:lines_to_cylinders(params) -- positions key = vec3f\n\t\t\t\t\n\t\t\t\t\tfloat scale = 0.01f;\n\t\t\t\t\tint steps = 4;\n\n\t\t\t\tvec2i:merge_lines(params) -- required:\n\n\t\t\t\t\tstd::vector<float> * merge_radius, * radius;\n\t\t\t\t\tstd::vector<yocto::vec2f> * merge_texcoords, * texcoords;\n\t\t\t\t\tstd::vector<yocto::vec2i> * merge_lines;\n\t\t\t\t\tstd::vector<yocto::vec3f> * merge_normals, * merge_positions, * normals, * positions;\n\n\n\t\t\t\tsubdivide_lines, subdivided_vertices = vec2i:subdivide_lines(div) -- vec1f, vec2f, vec3f, or vec4f\n\n\t\t\t\tvec2i:update_line(vindex, {index1, index2})\n\t\t\t\tvec2i:update_line(vindex, index1, index2)\n\t\t\t\n\t\t\t- vec3i:\n\n\t\t\t\tvec3i:append_triangle({index1, index2, index3}) -- array, 1-based\n\t\t\t\tvec3i:append_triangle(index1, index2, index3)\n\n\t\t\t\tvec3i = vec3i:flip_triangles()\n\n\t\t\t\tvec3i:merge_triangles(params) -- required:\n\n\t\t\t\t\tstd::vector<yocto::vec2f> * merge_texcoords, * texcoords;\n\t\t\t\t\tstd::vector<yocto::vec3i> * merge_triangles;\n\t\t\t\t\tstd::vector<yocto::vec3f> * merge_normals, * merge_positions, * normals, * positions;\n\t\n\t\t\t\tsubdivide_triangles, subdivided_vertices = vec3i:subdivide_lines(div) -- vec1f, vec2f, vec3f, or vec4f; vec3i, vec*f, * corresponding to div\n\n\t\t\t\tvec3i:triangles_normals(positions, normals) -- vec3f\n\t\t\t\tnormals = vec3i:triangles_normals(positions)\n\n\t\t\t\tvec4f = vec3i:triangles_tangent_spaces(positions, normals, texcoords, tangents) -- vec3f, vec3f, vec2f\n\t\t\t\tvec4i = vec3i:triangles_to_quads()\n\n\t\t\t\tvec3i:update_triangle(tindex, {index1, index2, index3}) -- array, 1-based\n\t\t\t\tvec3i:update_triangle(tindex, index1, index2, index3)\n\n\t\t\t\twelded_triangles, welded_positions = vec3i:weld_triangles(positions, threshold) -- vec3f, float; vec3i, vec3f\n\t\t\t\n\t\t\t- vec4i:\n\t\t\t\n\t\t\t\tvec4i:append_quad({index1, index2, index3, index4}) -- array, 1-based\n\t\t\t\tvec4i:append_quad(index1, index2, index3, index4)\n\n\t\t\t\tvec2i = vec4i:bezier_to_lines()\n\t\t\t\tvec4i = vec4i:flip_quads()\n\n\t\t\t\tvec4i:merge_quads(params) -- required:\n\n\t\t\t\t\tstd::vector<yocto::vec2f> * merge_texcoords, * texcoords;\n\t\t\t\t\tstd::vector<yocto::vec3f> * merge_normals, * merge_positions, * normals, * positions;\n\t\t\t\t\tstd::vector<yocto::vec4i> * merge_quads;\n\n\t\t\t\tvec4i:quads_normals(positions, normals) -- vec3f\n\t\t\t\tnormals = vec4i:quads_normals(positions)\n\n\t\t\t\tvec3i vec4i:quads_to_triangles()\n\t\t\t\t\n\t\t\t\tvec4i[, split_positions][, split_normals][, split_texcoords] = vec4i:split_facevarying(opts)\n\n\t\t\t\t\tstd::vector<yocto::vec2f> tvec, * texcoords = nullptr, * split_texcoords = &tvec;\n\t\t\t\t\tstd::vector<yocto::vec3f> nvec, pvec, * normals = nullptr, * split_normals = &nvec, * positions = nullptr, * split_positions = &pvec;\n\t\t\t\t\tstd::vector<yocto::vec4i> qvec, qnone, * split_quads = &qvec, * qnorms = &qnone, * qtex = &qnone;\n\n\t\t\t\t\toptions.WithFieldDo("split_quads", [L, &split_quads]() {\n\t\t\t\t\t\tsplit_quads = &GetVector4i(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("positions", [L, &positions]() {\n\t\t\t\t\t\tpositions = &GetVector3f(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("split_positions", [L, positions, &split_positions]() {\n\t\t\t\t\t\tif (positions) split_positions = &GetVector3f(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("normals", [L, &normals]() {\n\t\t\t\t\t\tnormals = &GetVector3f(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("split_normals", [L, normals, &split_normals]() {\n\t\t\t\t\t\tif (normals) split_normals = &GetVector3f(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("texcoords", [L, &texcoords]() {\n\t\t\t\t\t\ttexcoords = &GetVector2f(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("split_texcoords", [L, texcoords, &split_texcoords]() {\n\t\t\t\t\t\tif (texcoords) split_texcoords = &GetVector2f(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("quadsnorm", [L, &qnorms]() {\n\t\t\t\t\t\tqnorms = &GetVector4i(L, -1);\n\t\t\t\t\t})\n\t\t\t\t\t\t.WithFieldDo("quadstexcoord", [L, &qtex]() {\n\t\t\t\t\t\tqtex = &GetVector4i(L, -1);\n\t\t\t\t\t});\n\n\t\t\t\tsubdivided_beziers, subdivided_vertices = vec4i:subdivide_lines(div) -- vec1f, vec2f, vec3f, or vec4f; vec4i, vec*f, * corresponding to div\n\t\t\t\tsubdivided_quads, subdivided_vertices = vec4i:subdivide_catmullclark(div) -- vec1f, vec2f, vec3f, or vec4f; vec4i, vec*f, * corresponding to div\n\t\t\t\tsubdivided_quads, subdivided_vertices = vec4i:subdivide_quads(div) -- vec1f, vec2f, vec3f, or vec4f; vec4i, vec*f, * corresponding to div\n\n\t\t\t\tvec4i:update_quad(qindex, {index1, index2, index3, index4}) -- array, 1-based quad\n\t\t\t\tvec4i:update_quad(qindex, index1, index2, index3, index4)\n\n\t\t\t\twelded_quads, welded_positions  = vec4i:weld_quads(positions, threshold) -- vec3f, float; vec4i, vec3f\n\t\t\t\n\t\t\t- vec1f:\n\n\t\t\t\tvec1f:append(x) -- float\n\n\t\t\t\tshape_data = vec1f:make_heightfield(size) -- vec2i\n\n\t\t\t\tvec1f:update(index, x) -- float\n\t\t\n\t\t\t- vec2f:\n\n\t\t\t\tvec2f:append({x, y}) -- float\n\t\t\t\tvec2f:append(x, y)\n\n\t\t\t\tvec2f:update(index, {x, y}) -- float\n\t\t\t\tvec2f:update(index, x, y)\n\n\t\t\t- vec3f:\n\n\t\t\t\tvec3f = vec3f:align_vertices({x, y, z}) -- array, each is "none", "min", "max", or "center"\n\n\n\t\t\t\tvec3f:append({x, y, z}) -- float\n\t\t\t\tvec3f:append(x, y, z)\n\n\t\t\t\tvec3f:flip_normals()\n\t\t\t\t\n\t\t\t\tshape_data = vec3f:lines_to_cylinders(opts)\n\n\t\t\t\t\tfloat scale = 0.01f;\n\t\t\t\t\tint steps = 4;\n\t\t\t\t\t\n\t\t\t\tshape_data = vec3f:points_to_spheres(opts)\n\t\t\t\t\n\t\t\t\t\tfloat scale = 0.01f;\n\t\t\t\t\tint steps = 4;\n\n\t\t\t\tshape_data = vec3f:polyline_to_cylinders(opts)\n\n\t\t\t\t\tfloat scale = 0.01f;\n\t\t\t\t\tint steps = 4;\n\n\t\t\t\tvec3f:update(index, {x, y, z}) -- float\n\t\t\t\tvec3f:update(index, x, y, z)\n\n\t\t\t\twelded_positions, welded_indices = vec3f:weld_vertices(positions, threshold) -- vec3f, float; vec3f, vec1i\n\t\t\t\n\t\t\t- vec4f:\n\t\t\t\n\t\t\t\tvec4f:append({x, y, z, w}) -- float\n\t\t\t\tvec4f:append(x, y, z, w)\n\n\t\t\t\tshape_data = vec4f:make_heightfield(size) -- vec2i\n\n\t\t\t\tvec4f:update(index, {x, y, z, w}) -- float\n\t\t\t\tvec4f:update(index, x, y, z, w)\n'})})]})}function v(t={}){const{wrapper:e}={...(0,a.R)(),...t.components};return e?(0,s.jsx)(e,{...t,children:(0,s.jsx)(r,{...t})}):r(t)}},8453:(t,e,n)=>{n.d(e,{R:()=>i,x:()=>c});var s=n(6540);const a={},o=s.createContext(a);function i(t){const e=s.useContext(o);return s.useMemo((function(){return"function"==typeof t?t(e):{...e,...t}}),[e,t])}function c(t){let e;return e=t.disableParentContext?"function"==typeof t.components?t.components(a):t.components||a:i(t.components),s.createElement(o.Provider,{value:e},t.children)}}}]);