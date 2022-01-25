pragma solidity ^0.4.25;

library Set {

    struct Data{
        mapping(int => bool) data;
    }

    function insert(Data storage content,int index) public returns (bool) {
        if (content.data[index]) {
            return false;
        }
        content.data[index] = true;

        return true;
    }

    function remove(Data storage content,int index) public returns (bool) {
        if (!content.data[index]) {
            return false;
        }
        content.data[index] = false;
        return true;
    }

    function contain(Data storage content,int index) public view returns (bool){
        return content.data[index];
    }
}

contract LibraryUseCase {
    Set.Data data;

    function insert(int index) public returns (bool) {
        return Set.insert(data,index);
    }

    function remove(int index) public returns (bool) {
        return Set.remove(data,index);
    }

    function contain(int index) public view returns (bool) {
        return Set.contain(data,index);
    }
}