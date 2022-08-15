https://openscad.org/cheatsheet/index.html

## 1.这个语言支持的立体形状

cube 长方体

sphere 圆球

cylinder 圆柱（梯形圆柱、圆锥均可）

polyhedron 多边体（给出顶点和面）

## 2.支持的立体变换

平移、旋转、放缩、镜像、颜色、offset（试着有点像闭包之类的）、minkowski（把所有的结点加起来？）、hull（Displays the [convex hull](https://www.cgal.org/Manual/latest/doc_html/cgal_manual/Convex_hull_2/Chapter_main.html) of child nodes.）、乘以一个矩阵

交集、并集、差集



从2d叠起来迭代到3d，可以有尺度变化、可以弯曲

https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_the_2D_Subsystem#linear_extrude

从2d旋转迭代到3d

https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_the_2D_Subsystem#rotate_extrude