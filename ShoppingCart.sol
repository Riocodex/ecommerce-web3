//things this application should be able to do
//1) users should be able to view the list of all the items in sale in the application
//2)users should be able to see items..but cant buy nor sell till they login and register
//3)users should be able to upload stuff they would like to sell with a certain price
//4)users should obviously be able to buy items..and once they are bought they wont be displayed in the list of sales anymore
//////====== EXTRA FUNCTIONALITIES
//5) users(who have logged in) can buy any item except the one they sold ..the option there would be to delete
//6)users should be able to add an item they would want to buy in their cart
//7)users should be able to like an item or star an item
//ikuzu!

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.2 <0.9.0;
contract ShoppingCart{
    address payable owner;
    constructor(){
        owner = payable(owner);
    }
    //this will be the struct to all the items that will be put on sale by users and will be available for users to buy

    //this will be the struct that contains the details of a specific item 
    struct itemDetails{
        string name;
        uint256 price;
        address payable owner;
    }
    //this will be the mapping to a specific item
    mapping(string => itemDetails) public  nameToItemDetails;
    //item specified
     
    //this will be an array of all the items a specific user created or published
    itemDetails []  items;

   struct customerDetails{
        address payable owner;
        string name;

    }
    mapping(address => customerDetails) public addressToCustomerDetails;
    customerDetails[]  allCustomers;

    modifier ifOwnerExist{
        require (addressToCustomerDetails[msg.sender].owner != msg.sender, "user already exists");
        _;
    }
    function register(string memory _name)public ifOwnerExist() returns(string memory){
        //to add the details of a specific user to the struct
        addressToCustomerDetails[msg.sender] = customerDetails(
            payable(msg.sender),
            _name
        );
        //this is to add that specific user to the array of customers that will be displayed laterx
           allCustomers.push(customerDetails(
            payable(msg.sender),
            _name
            ));
        return "Welcome to Rios shopping smart contract";
    }
    modifier checkOwner{
        require(addressToCustomerDetails[msg.sender].owner ==msg.sender, "user doesnt exist");
        _;
    }
    function postAnItem(string memory _name, uint256 _price)public checkOwner() {
        nameToItemDetails[_name] = itemDetails(
            _name,
            _price,
            payable(msg.sender)
        );
        items.push(itemDetails(
            _name,
            _price,
            payable(msg.sender)
        ));
    }
    function viewItems()public view returns(itemDetails[] memory){
        return items;
    }
    function viewCustomers() public view returns(customerDetails[] memory){
        return allCustomers;
    }
    function buyItem(string memory _name)public returns(string memory){
        
    }

}