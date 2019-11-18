// created by Ethan Wessel, Will Shada, Marco Mariscal and Anthony Albertorio

pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;

// v1.1
contract Session {
    bytes32 public name;
    bytes32 public description;
    
    // models data types
    struct Student {
        bytes32 name;
        address payable studentAddress;
        Goal[] goals;
        uint256 dateStarted;
    }
    
    enum States { Pending, Failed, Completed }
    
    struct Goal {
        bytes32 description;
        uint256 deposit;
        uint256 startDate;
        States state;
        States studentVote;
        States teacherVote;
        States principleVote;
    } 
    
    struct Teacher {
        bytes32 name;
        address payable teacherAddress;
    }
    
    // initalize storage variables
    mapping(address => Student) public students;
    Teacher public teacher;
    address public principle; // Arbitrates conflicts
    
    // constructor
    constructor(address payable teacherInput) public {
        teacher.teacherAddress = teacherInput; 
    }
    
    function addStudent(bytes32 studentName) public {
        students[msg.sender].name = studentName;
        students[msg.sender].studentAddress = msg.sender;
        students[msg.sender].dateStarted = now;
    }
    
    function addStudentGoal(bytes32 goalDescription, uint256 startDate) public payable {
        require(msg.value > 0);
        require(students[msg.sender].studentAddress != address(0));
        students[msg.sender].goals.push(
            Goal(goalDescription, msg.value, startDate, States.Pending)
        );
    }
    
    function studentWithdraw() external {
        
    }
    
    // teacher and student verify
    // who does it get distributed to?
    // only student and teacher can do it.
    function verify() public returns (bool) {
        // change state of goal
    }
    
    // get the money out! 
    // definite major security flaws in 1st iteration.
    // anyone can do this
    function penalize(Student memory _student) public {
        // have the check to check for goals. 
        require(msg.sender == teacher.teacherAddress); // only teacher can call this.
        //teacher.teacherAddress.transfer(_student.deposit);  // come back to this.
    }
    
    // can't query a whole array with solidity, needs helper function 
    // function returnGoals() public returns (string[]) {
        
    // } 
    
    // function returnDateGoalsVerified() public returns (mapping) {
        
    // }
    
    // function returnGoalsVerified() public returns (string[]) {
        
    // } 
}

 /*
    Its a play aka program
    V1. lets assume everyone is honest.
    Who are our actors? What are the objects/model
        Student
        Verifier
    
    Lets assume good faith:
        As long as student is not verifying self, its good.
        One thumbs is teacher, other is other student.
    
    Whats the play about? Whats the contract about?
         let's make a bet.
         The student will self assess how much 
         they can reasonably study in a week.
         If the student either: 
         fails to reach goal by not providing evidence 
         or not showing up, they lose their stake.
         
    What do the actors do? What are the roles of obj/models?
        Student:
            Makes the bet aka stakes eth
            shows up/signs in
                v1. sign in with metamask
            point to proof -> point to IPFS hash
        Verifier:
            show up/sign in
                sign into app via metamask
            can verify student
                v1. Thumbs up or thumbs down
            Can verify other verifiers
                
            How many verifiers do we need, redundency?
                Just two verifier.
                Both need to do thumbs on student
            
    What data types can we use to represent obj/models?
        Probably going to be a struct...
        
    UI considerations:
        get inspired: kickback.events feel.
        1st page:
            all students
        2nd page: 
            specific student and goals
                each has a box with date, time and goal
            streak- Make it look like a tree.
            v2. comments on each goal.
next goals:
    upload to meetup github
    finish functions
    revise to make sure that it acutally compiles
    give it a second look to see what needs to be fixed.
    Deploy
    Begin to talk about v1.1....

    v2. 
    Factory contract for each class
    3Box
    Comments
    */
