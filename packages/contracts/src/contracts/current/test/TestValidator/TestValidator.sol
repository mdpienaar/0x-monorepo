/*

  Copyright 2018 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

pragma solidity ^0.4.24;

import "../../protocol/Exchange/interfaces/IValidator.sol";

contract TestValidator is 
    IValidator
{

    // The single valid signer for this wallet.
    address validSigner;

    /// @dev constructs a new `TestValidator` with a single valid signer.
    /// @param _validSigner The sole signer for this wallet.
    constructor (address _validSigner) public {
        validSigner = _validSigner;
    }

     /// @dev Verifies that a signature is valid.
    /// @param hash Message hash that is signed.
    /// @param signer Address that should have signed the given hash.
    /// @param signature Proof of signing.
    /// @return Validity of order signature.
    function isValidSignature(
        bytes32 hash,
        address signer,
        bytes signature
    )
        external
        view
        returns (bool isValid)
    {
        return (signer == validSigner);
    }
}
