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
        [4, 5, 1, 0],
        [6, 7, 5, 4],
        [7, 6, 2, 3],
        [0, 2, 6, 4],
        [5, 7, 3, 1]
        ]);
}

// 龙爪
module make_claw() {
        //脚掌
linear_extrude(height = 23, center = false, convexity = 10, twist = 200, scale = 0.3)
translate([2, 0, 0])
circle(r = 4);
    //大拇指
translate([-0.7, 0, 24])
    rotate([0, 60, -60])
linear_extrude(height = 5, center = false, convexity = 10, twist = 200, $fn = 30, scale = 0.2)
translate([1, 0, 0])
circle(r = 0.9);
    //第二个指头
translate([-0.7, 0.1, 24])
    rotate([0, 60, 0])
linear_extrude(height = 6, center = false, convexity = 10, twist = 60, $fn = 30, scale = 0.1)
translate([1, 0, 0])
circle(r = 0.8);
    //第三个指头
translate([-0.7, 0.5, 24])
    rotate([0, 60, 20])
linear_extrude(height = 6, center = false, convexity = 10, twist = 60, $fn = 40, scale = 0.1)
translate([1, 0, 0])
circle(r = 0.7);
//掌中宝
translate([-0.58, 0.14, 23])
sphere(r = 1.2, $fn = 30);
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
        [-16, 6, 23], //2
        [-16, -6, 23], //3
        [15, 9, 29], //4
        [15, -9, 29], //5
        [5, 9, 49], //6
        [5, -9, 49] //7
        ];

make_hexahedron(lower_lip_points);
make_hexahedron(upper_lip_points);
//minkowski(){
make_hexahedron(head_points);
    //cylinder(h = 0.5, r = 0.3, $fn = 30);
//}

// 身子
translate([250, 0, 107])
rotate([0, -110, 0])
scale([1.3, 1, 1])
linear_extrude(height = 250, center = false, convexity = 10, twist = 360, scale = 1.4)
translate([10, 0, 0])
circle(r = 6);


// 尾巴
translate([245.3, 0, 119.2])
scale([2.3, 0.92, 1.12])
rotate([0, 79, 0])
for(i = [0:0.5:5]){
    // 尾巴周围的乱毛
    rotate(72 * i)
    translate([5 - i, 0, 0])
    linear_extrude(height = 15 - i, center = false, convexity = 10, twist = 270, scale = 0)
    translate([1, 0, 0])
    circle(r = i);
    //cylinder(h = 15 - i, r1 = i, r2 = 0);
    // 尾巴周围的乱毛
    rotate(180 - 72 * i)
    translate([i, 0, 0])
    linear_extrude(height = 10 + i, center = false, convexity = 10, twist = -270, scale = 0)
    translate([1, 0, 0])
    circle(r = 5 - i);
    //cylinder(h = 10 + i, r1 = 5 - i, r2 = 0);
    // 尾巴的中心支柱
    rotate(-72 * i)
    translate([0.5, 0, 0])
    linear_extrude(height = 10 + 2 * (i * 2 % 3), center = false, convexity = 10, twist = -270, scale = 0)
    translate([1, 0, 0])
    circle(r = 5.2);
    //cylinder(h = 10 + 2 * (i * 2 % 3), r1 = 5.2, r2 = 0);
    
}


// 龙爪
translate([60, 16, 48])
rotate([150, 10, 230])
make_claw();
translate([180, -10, 75])
rotate([150, -30, 120])
make_claw();

translate([65, 9, 47])
mirror([0, 1, 0])
rotate([150, 10, 200])
make_claw();
translate([175, -9, 75])
mirror([0, 1, 0])
rotate([140, -40, 150])
make_claw();

/*
// 上嘴唇
translate([-21.6, 0, 5.5])
rotate([-42, 0, 90])
scale([1, 1.8, 1])
rotate_extrude(angle = 180, convexity = 10, $fn = 200)
square(size = [3.2, 3.3]);
*/
