// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
contract Traceability {
    struct Farm {
        string farmId;
        string farmName;
        string location;
    }

    struct Product {
        string productId;
        string productName;
        Farm farm;
        uint256 harvestDate;
    }

    struct Transport {
        string transportId;
        string transportMode;
        string transportCompany;
    }

    mapping(string => Product) public products;
    mapping(string => Transport) public transports;

    function addFarm(
        string memory _farmId,
        string memory _farmName,
        string memory _location
    ) internal pure returns (Farm memory) {
        return Farm(_farmId, _farmName, _location);
    }

    function addProduct(
        string memory _productId,
        string memory _productName,
        string memory _farmId,
        string memory _farmName,
        string memory _location,
        uint256 _harvestDate
    ) public {
        Farm memory farm = addFarm(_farmId, _farmName, _location);
        products[_productId] = Product(_productId, _productName, farm, _harvestDate);
    }

    function addTransport(
        string memory _transportId,
        string memory _transportMode,
        string memory _transportCompany
    ) public {
        transports[_transportId] = Transport(_transportId, _transportMode, _transportCompany);
    }

    function getProduct(string memory _productId) public view returns (Product memory) {
        return products[_productId];
    }

    function getTransport(string memory _transportId) public view returns (Transport memory) {
        return transports[_transportId];
    }
}