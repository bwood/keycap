module mySphere (radius, x, y, z) {
    resize([x, y, z])
    sphere(r = radius);
}

module myEllipse(radius, x, y, z) {
    linear_extrude(height = 1.5, center = false, convexity = 10)
        resize([x, y, z])
        circle(r = radius);
}


myRadius = 10;
myX = 20;
myY = 10;
myZ = 10;

module cap(myRadius, myX, myY, myZ) {
    difference () {
        mySphere(myRadius, myX, myY, myZ);
        translate([0,0,-2.5]) mySphere(myRadius, myX, myY, myZ);
    }
}

difference () {
    cap(myRadius, myX, myY, myZ);
    translate([0,0, -1.5]) myEllipse(myRadius, myX, myY, myZ);    
}



