/* 形成一个六面体
    传递六面体的8个点，！有顺序:
       7--6
      /| /|
    3--2  |
    |  5--4
    | /| /
    1--0
*/
module make_hexahedron(points){
    polyhedron(points=points, faces=[[0, 1, 3, 2],
        [0, 1, 5, 4],
        [4, 5, 7, 6],
        [7, 6, 2, 3],
        [0, 2, 6, 4],
        [1, 3, 7, 5]
        ]);
}

// 下嘴唇
lower_lip_points = [
        [-19, 2.8, 2], //0
        [-19, -2.8, 2], //1
        [-20, 2.8, 3], //2
        [-20, -2.8, 3], //3
        [-7, 6, 13], //4
        [-7, -6, 13], //5
        [-8.8, 6, 16.2], //6
        [-8.8, -6, 16.2] //7
        ];

// 上嘴唇
upper_lip_points = [
        [-21.7, 3.2, 5.5], //0
        [-21.7, -3.2, 5.5], //1
        [-23.9, 3.2, 8], //2
        [-23.9, -3.2, 8], //3
        [-8.8, 6, 16.4], //4
        [-8.8, -6, 16.4], //5
        [-12, 6, 20.3], //6
        [-12, -6, 20.3] //7
        ];
      
// 龙头  
head_points = [
        [-7, 6, 13], //0
        [-7, -6, 13], //1
        [-13, 6, 21], //2
        [-13, -6, 21], //3
        [15, 9, 29], //4
        [15, -9, 29], //5
        [5, 9, 42], //6
        [5, -9, 42] //7
        ];

make_hexahedron(lower_lip_points);
make_hexahedron(upper_lip_points);
make_hexahedron(head_points);

translate([240, -10, 130])
rotate([0, -20, 0])
rotate([0, -90, 0])
scale([1.3, 1, 1])
linear_extrude(height = 250, center = false, convexity = 10, twist = 0, $fn = 100, scale = 1.4)
translate([10, 0, 0])
circle(r = 8);


/*
// 上嘴唇
translate([-21.6, 0, 5.5])
rotate([-42, 0, 90])
scale([1, 1.8, 1])
rotate_extrude(angle = 180, convexity = 10, $fn = 200)
square(size = [3.2, 3.3]);
*/
