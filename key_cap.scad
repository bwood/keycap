module mySphere (radius, x, y, z) {
    resize([x, y, z])
    sphere(r = radius);
}

module myEllipse(radius, height, x, y, z) {
    linear_extrude(height = height, center = false, convexity = 10)
        resize([x, y, z])
        circle(r = radius);
}


myRadius = 10;
myX = 20;
myY = 10;
myZ = 10;

eHeight = 1.5;

capThickness = 2;

module cap(myRadius, capThickness, myX, myY, myZ) {
    difference () {
        mySphere(myRadius, myX, myY, myZ);
        translate([0,0, -capThickness]) mySphere(myRadius, myX, myY, myZ);
    }
}

module clips(myRadius, eHeight, myX, myY, myZ) {
    translate([0,0, -1.5]) myEllipse(myRadius, eHeight, myX, myY, myZ);    
}

difference () {
    cap(myRadius, capThickness, myX, myY, myZ);
    translate([0,0, -1.5]) myEllipse(myRadius, eHeight, myX, myY, myZ);    
}

translate([0,0,-10]) clips(myRadius, eHeight, myX, myY, myZ);



