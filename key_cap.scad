module mySphere (x, y, z) {
    resize([x, y, z])
    sphere(r = 1, $fn=20);
}

module myEllipse(height, x, y, z) {
    linear_extrude(height = height, center = false, convexity = 10)
        resize([x, y, z])
        // since we are resizing, radius doesn't affect the size.
        // to change the size use x, y, z.
        circle(r = 1, $fn=20);
}

// Existing Keys
dX = 24.28;
dY = 11.20;
dZ = 4.5;

myRadius = 10;
myX = 20;
myY = 10;
myZ = 10;

eHeight = 1.5;

capThickness = 2;

module cap(capThickness, myX, myY, myZ) {
    difference () {
        mySphere(myX, myY, myZ);
        translate([0,0, -capThickness]) mySphere(myX, myY, myZ);
    }
}



module clips(eHeight, myX, myY, myZ) {
    translate([0,0, -1.5]) 
    difference() {
       myEllipse(eHeight, myX, myY, myZ);         
       myEllipse(eHeight, myX - 2, myY - 2 , myZ);           
    }
    // TODO: This ring should become 4 posts:
    // left: 2 "L" posts
    // right: 2 posts with triangles on them for snap on.

}

// Remove the negative z material from the cap
difference () {
    cap(capThickness, myX, myY, myZ);
    translate([0,0, -1.5]) myEllipse(eHeight, myX, myY, myZ);    
}

translate([0,0,-1]) clips(eHeight, myX, myY, myZ);

// TODO: Add rotated (triangular?) sphere on top for ergo- adjustment.

//TODO: Mark part with note name of key





