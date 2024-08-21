
// File: @openzeppelin/contracts/utils/introspection/IERC165.sol


// OpenZeppelin Contracts (last updated v5.0.0) (utils/introspection/IERC165.sol)

pragma solidity 0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: @openzeppelin/contracts/utils/introspection/ERC165.sol


// OpenZeppelin Contracts (last updated v5.0.0) (utils/introspection/ERC165.sol)

 


/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 */
abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}

// File: @openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol


// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC1155/IERC1155Receiver.sol)

 


/**
 * @dev Interface that must be implemented by smart contracts in order to receive
 * ERC-1155 token transfers.
 */
interface IERC1155Receiver is IERC165 {
    /**
     * @dev Handles the receipt of a single ERC1155 token type. This function is
     * called at the end of a `safeTransferFrom` after the balance has been updated.
     *
     * NOTE: To accept the transfer, this must return
     * `bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"))`
     * (i.e. 0xf23a6e61, or its own function selector).
     *
     * @param operator The address which initiated the transfer (i.e. msg.sender)
     * @param from The address which previously owned the token
     * @param id The ID of the token being transferred
     * @param value The amount of tokens being transferred
     * @param data Additional data with no specified format
     * @return `bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"))` if transfer is allowed
     */
    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    ) external returns (bytes4);

    /**
     * @dev Handles the receipt of a multiple ERC1155 token types. This function
     * is called at the end of a `safeBatchTransferFrom` after the balances have
     * been updated.
     *
     * NOTE: To accept the transfer(s), this must return
     * `bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"))`
     * (i.e. 0xbc197c81, or its own function selector).
     *
     * @param operator The address which initiated the batch transfer (i.e. msg.sender)
     * @param from The address which previously owned the token
     * @param ids An array containing ids of each token being transferred (order and length must match values array)
     * @param values An array containing amounts of each token being transferred (order and length must match ids array)
     * @param data Additional data with no specified format
     * @return `bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"))` if transfer is allowed
     */
    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    ) external returns (bytes4);
}

// File: @openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol


// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC1155/utils/ERC1155Holder.sol)

 



/**
 * @dev Simple implementation of `IERC1155Receiver` that will allow a contract to hold ERC1155 tokens.
 *
 * IMPORTANT: When inheriting this contract, you must include a way to use the received tokens, otherwise they will be
 * stuck.
 */
abstract contract ERC1155Holder is ERC165, IERC1155Receiver {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return interfaceId == type(IERC1155Receiver).interfaceId || super.supportsInterface(interfaceId);
    }

    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC1155Received.selector;
    }

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC1155BatchReceived.selector;
    }
}

// File: @openzeppelin/contracts/token/ERC721/IERC721Receiver.sol


// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC721/IERC721Receiver.sol)

 

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be
     * reverted.
     *
     * The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

// File: @openzeppelin/contracts/security/ReentrancyGuard.sol


// OpenZeppelin Contracts (last updated v4.9.0) (security/ReentrancyGuard.sol)

pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be _NOT_ENTERED
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
     * `nonReentrant` function in the call stack.
     */
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == _ENTERED;
    }
}

// File: IERC1155.sol


// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC1155/IERC1155.sol)


/**
 * @dev Required interface of an ERC1155 compliant contract, as defined in the
 * https://eips.ethereum.org/EIPS/eip-1155[EIP].
 */
interface IERC1155 is IERC165 {
    /**
     * @dev Emitted when `value` amount of tokens of type `id` are transferred from `from` to `to` by `operator`.
     */
    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);

    /**
     * @dev Equivalent to multiple {TransferSingle} events, where `operator`, `from` and `to` are the same for all
     * transfers.
     */
    event TransferBatch(
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );

    /**
     * @dev Emitted when `account` grants or revokes permission to `operator` to transfer their tokens, according to
     * `approved`.
     */
    event ApprovalForAll(address indexed account, address indexed operator, bool approved);

    /**
     * @dev Emitted when the URI for token type `id` changes to `value`, if it is a non-programmatic URI.
     *
     * If an {URI} event was emitted for `id`, the standard
     * https://eips.ethereum.org/EIPS/eip-1155#metadata-extensions[guarantees] that `value` will equal the value
     * returned by {IERC1155MetadataURI-uri}.
     */
    event URI(string value, uint256 indexed id);

    /**
     * @dev Returns the value of tokens of token type `id` owned by `account`.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function balanceOf(address account, uint256 id) external view returns (uint256);

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {balanceOf}.
     *
     * Requirements:
     *
     * - `accounts` and `ids` must have the same length.
     */
    function balanceOfBatch(
        address[] calldata accounts,
        uint256[] calldata ids
    ) external view returns (uint256[] memory);

    /**
     * @dev Grants or revokes permission to `operator` to transfer the caller's tokens, according to `approved`,
     *
     * Emits an {ApprovalForAll} event.
     *
     * Requirements:
     *
     * - `operator` cannot be the caller.
     */
    function setApprovalForAll(address operator, bool approved) external;

    /**
     * @dev Returns true if `operator` is approved to transfer ``account``'s tokens.
     *
     * See {setApprovalForAll}.
     */
    function isApprovedForAll(address account, address operator) external view returns (bool);

    /**
     * @dev Transfers a `value` amount of tokens of type `id` from `from` to `to`.
     *
     * WARNING: This function can potentially allow a reentrancy attack when transferring tokens
     * to an untrusted contract, when invoking {onERC1155Received} on the receiver.
     * Ensure to follow the checks-effects-interactions pattern and consider employing
     * reentrancy guards when interacting with untrusted contracts.
     *
     * Emits a {TransferSingle} event.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - If the caller is not `from`, it must have been approved to spend ``from``'s tokens via {setApprovalForAll}.
     * - `from` must have a balance of tokens of type `id` of at least `value` amount.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155Received} and return the
     * acceptance magic value.
     */
    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes calldata data) external;

    function royaltyFee() external view returns (uint256);
    function royaltyRecipient(uint256 tokenId) external view returns (address);

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {safeTransferFrom}.
     *
     *
     * WARNING: This function can potentially allow a reentrancy attack when transferring tokens
     * to an untrusted contract, when invoking {onERC1155BatchReceived} on the receiver.
     * Ensure to follow the checks-effects-interactions pattern and consider employing
     * reentrancy guards when interacting with untrusted contracts.
     *
     * Emits a {TransferBatch} event.
     *
     * Requirements:
     *
     * - `ids` and `values` must have the same length.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155BatchReceived} and return the
     * acceptance magic value.
     */
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    ) external;
}
// File: IERC721.sol


// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC721/IERC721.sol)



/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Note that the caller is responsible to confirm that the recipient is capable of receiving ERC721
     * or else they may be permanently lost. Usage of {safeTransferFrom} prevents loss, though the caller must
     * understand this adds an external call which potentially creates a reentrancy vulnerability.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool approved) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    function royaltyFee() external view returns (uint256);
    function royaltyRecipient(uint256 tokenId) external view returns (address);
    function royaltyFeeWithId(uint256 tokenId) external view returns (uint256);


    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}
// File: @openzeppelin/contracts/utils/math/SafeMath.sol


// OpenZeppelin Contracts (last updated v4.9.0) (utils/math/SafeMath.sol)

pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// File: @openzeppelin/contracts/utils/Context.sol


// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)

 

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol


// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)

 


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * The initial owner is set to the address provided by the deployer. This can
 * later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/IERC20.sol)

 

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// File: Aurum_Marketplace.sol


 









contract NFTMarketplace is Ownable,ReentrancyGuard,IERC721Receiver,ERC1155Holder {
    using SafeMath for uint256;

   IERC20 public ERC20Token;

    /**
     * @dev Fallback function to receive Ether.
     */
    receive() external payable {}

    address public marketplaceToken;
    uint256 public marketFeePercentage; // e.g., 100 means 1%
    uint256 private marketplaceBalance;
    uint256 public marketPlacePercentage;
    address public marketplaceOwner;

    struct Auction {address seller;address tokenContract;string  tokenType;uint256 tokenId;uint256 tokenAmount;uint256 startPrice;uint256 duration;bool setAuction;}

    struct Bid {address bidder;uint256 amount;}

    struct MarketItem {address tokenContract;address owner;string  tokenType;uint256 tokenId;uint256 tokenAmount;uint256 price;bool listNFT;}


    mapping(address => mapping(uint256 =>  mapping(address => Auction))) public auctions;
    mapping(address => mapping(uint256 => mapping(address => Bid))) public highestBids;
    mapping(address => mapping(uint256 => mapping(address => MarketItem))) public listNft;


    event AuctionCreated(address indexed seller,address indexed tokenContract,uint256 indexed tokenId,uint256 startPrice,uint256 duration);

    event AuctionEnded(address indexed seller,address indexed tokenContract,uint256 indexed tokenId,address winner,uint256 totalPrice);

    event MarketItemCreated(address indexed nftContract,uint256 indexed tokenId,address seller,uint256 price,bool indexed sold,bool isMarketItem);

    /**
     * @dev initializes the marketplace token address the contract.
     * @param _marketplaceToken The address of the marketplace token.
     */

    constructor(address _marketplaceOwner, address _marketplaceToken, uint256 _marketPlace) {
        marketplaceToken = _marketplaceToken;
        marketPlacePercentage = _marketPlace;
        marketplaceOwner = payable(_marketplaceOwner);
        // ERC20Token = _erc20token;
    }

    function changePercentage(uint256 _percentage) public onlyOwner {
        marketPlacePercentage = _percentage;
    }

    function changeMarketplaceOwner(address _address) public onlyOwner {
        marketplaceOwner = payable(_address);
    }

    function changeERC20Address(IERC20 _address) public onlyOwner {
        ERC20Token = _address;
    }

    /**
     * @dev ERC721Receiver callback function to signal acceptance of an ERC721 token.
    */

    function onERC721Received(
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes calldata _data
    ) external override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }

    /**
     * @dev Creates a new market item for sale.
     * @param _tokenContract Address of the token contract.
     * @param _tokenId ID of the token being listed.
     * @param _price Price of the token.
     * @param _amount Amount of ERC1155 tokens to list (for ERC1155 tokens).
     * @param _type Type of token ("erc721" or "erc1155").
     * @param owner Owner of the token.
    */

    function createMarketItem(
         address _tokenContract,
        uint256 _tokenId,
        uint256 _price,
        uint256 _amount,
        string memory _type,
        address owner
    ) external {
        if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("erc1155"))) require(_amount > 0, "Amount should be greater than zero");
        require(!auctions[_tokenContract][_tokenId][owner].setAuction, "Already set auction");
        require(!listNft[_tokenContract][_tokenId][owner].listNFT,"Nft already list for sell");

        if (keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("erc721"))) {
            // ERC721
            IERC721 erc721Token = IERC721(_tokenContract);
            require(erc721Token.ownerOf(_tokenId) == msg.sender, "You are not the owner of this token");
            IERC721(_tokenContract).safeTransferFrom(msg.sender, address(this), _tokenId);
        } else if (keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("erc1155"))) {
            // ERC1155
            IERC1155 erc1155Token = IERC1155(_tokenContract);
            require(erc1155Token.balanceOf(msg.sender,_tokenId) != 0, "You are not the owner of this token");
            require(erc1155Token.balanceOf(msg.sender,_tokenId) >= _amount, "You have insufficient amount of tokens");
            IERC1155(_tokenContract).safeTransferFrom(msg.sender, address(this), _tokenId, _amount, "");
        } else {
            revert("Unsupported token type");
        }

        listNft[_tokenContract][_tokenId][owner] = MarketItem({
            tokenContract: _tokenContract,
            owner: msg.sender,
            tokenType: _type,
            tokenId: _tokenId,
            tokenAmount: _amount,
            price: _price,
            listNFT: true
        });

        emit MarketItemCreated( _tokenContract, _tokenId, msg.sender, _price, false, true);
    }

    /**
     * @dev Purchases a market item.
     * @param _tokenContract Address of the token contract.
     * @param _tokenId ID of the token being purchased.
     * @param owner Owner of the token.
    */

    function createMarketSale(
        address _tokenContract,
        uint256 _tokenId,
        address owner
    ) external payable nonReentrant {

        MarketItem storage listNfts = listNft[_tokenContract][_tokenId][owner];
        require(listNft[_tokenContract][_tokenId][owner].listNFT,"Nft not list for sell");
        require(msg.value >= listNft[_tokenContract][_tokenId][owner].price,"Insufficient balance");
        uint256 royalityFee = 0;
        address royaltyRecipient;

        if (keccak256(abi.encodePacked(listNfts.tokenType)) == keccak256(abi.encodePacked("erc721"))) {
            // ERC721
            IERC721 erc721Token = IERC721(_tokenContract);
            if(marketplaceToken == _tokenContract){
                royalityFee = erc721Token.royaltyFeeWithId(_tokenId);
            }
            else {
                royalityFee = erc721Token.royaltyFee();
            }
            royaltyRecipient = erc721Token.royaltyRecipient(_tokenId);
            IERC721(_tokenContract).safeTransferFrom(address(this),msg.sender, _tokenId);
        } else if (keccak256(abi.encodePacked(listNfts.tokenType)) == keccak256(abi.encodePacked("erc1155"))) {
            // ERC1155
            IERC1155 erc1155Token = IERC1155(_tokenContract);
            royalityFee = erc1155Token.royaltyFee();
            royaltyRecipient = erc1155Token.royaltyRecipient(_tokenId);
            IERC1155(_tokenContract).safeTransferFrom(address(this),msg.sender, _tokenId, listNfts.tokenAmount, "");
        }

        uint256 totalPrice = listNfts.price;
        uint256 royaltyAmount = totalPrice.mul(royalityFee).div(100); // Calculate royalty amount
        uint256 sellerAmount = totalPrice.sub(royaltyAmount);
        uint256 marketPercentage = sellerAmount.mul(marketFeePercentage).div(100);
        uint256 sellerAmountFinal = sellerAmount.sub(marketFeePercentage);

        (bool royaltyTransferSuccess, ) = royaltyRecipient.call{value: royaltyAmount}("");
        require(royaltyTransferSuccess, "Failed to send royalty");
        
        (bool marketPercentageSuccess, ) = marketplaceOwner.call{value: marketPercentage}("");
        require(marketPercentageSuccess, "marketplace percentage to send failed");
        
        (bool success, ) = listNfts.owner.call{value: sellerAmountFinal}("");
        require(success, "Payment to seller failed");

        delete listNft[_tokenContract][_tokenId][owner];

        emit MarketItemCreated( _tokenContract, _tokenId, msg.sender, totalPrice, true, false);
  
    }

     function createMarketSaleByToken(
        address _tokenContract,
        uint256 _tokenId,
        address owner
    ) external payable nonReentrant {

        MarketItem storage listNfts = listNft[_tokenContract][_tokenId][owner];
        require(listNft[_tokenContract][_tokenId][owner].listNFT,"Nft not list for sell");
        uint256 balance = ERC20Token.balanceOf(msg.sender);
        require(balance >= listNfts.price,"Insufficient balance");
        uint256 royalityFee = 0;
        address royaltyRecipient;

        if (keccak256(abi.encodePacked(listNfts.tokenType)) == keccak256(abi.encodePacked("erc721"))) {
            // ERC721
            IERC721 erc721Token = IERC721(_tokenContract);
            if(marketplaceToken == _tokenContract){
                royalityFee = erc721Token.royaltyFeeWithId(_tokenId);
            }
            else {
                royalityFee = erc721Token.royaltyFee();
            }
            royaltyRecipient = erc721Token.royaltyRecipient(_tokenId);
            IERC721(_tokenContract).safeTransferFrom(address(this),msg.sender, _tokenId);
        } else if (keccak256(abi.encodePacked(listNfts.tokenType)) == keccak256(abi.encodePacked("erc1155"))) {
            // ERC1155
            IERC1155 erc1155Token = IERC1155(_tokenContract);
            royalityFee = erc1155Token.royaltyFee();
            royaltyRecipient = erc1155Token.royaltyRecipient(_tokenId);
            IERC1155(_tokenContract).safeTransferFrom(address(this),msg.sender, _tokenId, listNfts.tokenAmount, "");
        }

        uint256 totalPrice = listNfts.price;
        uint256 royaltyAmount = totalPrice.mul(royalityFee).div(100); // Calculate royalty amount
        uint256 sellerAmount = totalPrice.sub(royaltyAmount);
        uint256 marketPercentage = sellerAmount.mul(marketFeePercentage).div(100);
        uint256 sellerAmountFinal = sellerAmount.sub(marketFeePercentage);

        ERC20Token.transferFrom(msg.sender,royaltyRecipient,royaltyAmount);
        ERC20Token.transferFrom(msg.sender,marketplaceOwner,marketPercentage);
        ERC20Token.transferFrom(msg.sender,listNfts.owner,sellerAmountFinal);

        delete listNft[_tokenContract][_tokenId][owner];

        emit MarketItemCreated( _tokenContract, _tokenId, msg.sender, totalPrice, true, false);
  
    }

    /**
     * @dev unlist a market item from sale.
     * @param _tokenContract Address of the token contract.
     * @param _tokenId ID of the token being unlisted.
     * @param owner Owner of the token.
    */

    function unListItems(
        address _tokenContract,
        uint256 _tokenId,
        address owner
    ) external nonReentrant {

        MarketItem storage listNfts = listNft[_tokenContract][_tokenId][owner];
        require(listNft[_tokenContract][_tokenId][owner].listNFT,"Nft not list for sell");
        require(msg.sender == listNfts.owner,"Only Owner Can Unlist");
        uint256 totalPrice = listNfts.price;

        if (keccak256(abi.encodePacked(listNfts.tokenType)) == keccak256(abi.encodePacked("erc721"))) {
            // ERC721
            IERC721(_tokenContract).safeTransferFrom(address(this),listNfts.owner, _tokenId);
        } else if (keccak256(abi.encodePacked(listNfts.tokenType)) == keccak256(abi.encodePacked("erc1155"))) {
            // ERC1155
            IERC1155(_tokenContract).safeTransferFrom(address(this),listNfts.owner,_tokenId, listNfts.tokenAmount, "");
        }

        delete listNft[_tokenContract][_tokenId][owner];

        emit MarketItemCreated( _tokenContract, _tokenId, msg.sender, totalPrice, false, false);
    }

    /**
     * @dev Creates an auction for an ERC721 or ERC1155 token.
     * @param _tokenContract Address of the token contract.
     * @param _tokenId ID of the token being listed for auction.
     * @param _amount Amount of ERC1155 tokens to list (for ERC1155 tokens).
     * @param _startPrice Starting price of the auction.
     * @param _duration Duration of the auction.
     * @param _type Type of token ("erc721" or "erc1155").
     * @param owner Owner of the token.
    */

    function createAuction(
        address _tokenContract,
        uint256 _tokenId,
        uint256 _amount,
        uint256 _startPrice,
        uint256 _duration,
        string memory _type,
        address owner
    ) external nonReentrant {
        require(_startPrice > 0, "Start price should be greater than zero");
        require(_duration > 0, "Auction duration should be greater than zero");
        require(!auctions[_tokenContract][_tokenId][owner].setAuction, "Already set auction");
        require(!listNft[_tokenContract][_tokenId][owner].listNFT,"Nft already list for sell");
        if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("erc1155"))) require(_amount > 0, "Amount should be greater than zero");

        if (keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("erc721"))) {
            // ERC721
            IERC721 erc721Token = IERC721(_tokenContract);
            require(erc721Token.ownerOf(_tokenId) == msg.sender, "You are not the owner of this token");
            IERC721(_tokenContract).safeTransferFrom(msg.sender, address(this), _tokenId);
        } else if (keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("erc1155"))) {
            // ERC1155
            IERC1155 erc1155Token = IERC1155(_tokenContract);
            require(erc1155Token.balanceOf(msg.sender,_tokenId) != 0, "You are not the owner of this token");
            require(erc1155Token.balanceOf(msg.sender,_tokenId) >= _amount, "You have insufficient amount of tokens");
            IERC1155(_tokenContract).safeTransferFrom(msg.sender, address(this), _tokenId, _amount, "");
        } else {
            revert("Unsupported token type");
        }

        auctions[_tokenContract][_tokenId][owner] = Auction({
            seller: msg.sender,
            tokenContract: _tokenContract,
            tokenType: _type,
            tokenId: _tokenId,
            tokenAmount: _amount,
            startPrice: _startPrice,
            duration: _duration,
            setAuction: true
        });

        emit AuctionCreated(msg.sender, _tokenContract, _tokenId, _startPrice, _duration);
    }

    /**
     * @dev Places a bid in an ongoing auction.
     * @param _tokenContract Address of the token contract.
     * @param _tokenId ID of the token in the auction.
     * @param owner Owner of the token.
    */

    function placeBid(address _tokenContract, uint256 _tokenId, address owner) external payable nonReentrant{
        Auction storage auction = auctions[_tokenContract][_tokenId][owner];
        require(auction.duration > 0, "Auction does not exist");
        require(block.timestamp < auction.duration, "Auction has ended");
        require(msg.value > auction.startPrice, "Bid amount must be higher");
        require(msg.value > highestBids[_tokenContract][_tokenId][owner].amount, "Bid amount must be higher");

        Bid memory previousBid = highestBids[_tokenContract][_tokenId][owner];
        highestBids[_tokenContract][_tokenId][owner] = Bid({
            bidder: msg.sender,
            amount: msg.value
        });

        // Refund the previous bidder
        if (previousBid.bidder != address(0)) {
            (bool success, ) = previousBid.bidder.call{value: previousBid.amount}("");
            require(success, "Bidder refund failed");
        }
    }

    /**
     * @dev Ends an ongoing auction and transfers the token to the highest bidder.
     * @param _tokenContract Address of the token contract.
     * @param _tokenId ID of the token in the auction.
     * @param owner Owner of the token.
    */

    function endAuction(address _tokenContract, uint256 _tokenId, address owner) external payable nonReentrant {
        Auction memory auction = auctions[_tokenContract][_tokenId][owner];
        require(auction.duration > 0, "Auction does not exist");
        require(auction.tokenContract == _tokenContract, "Auction does not exist");
        require(block.timestamp >= auction.duration, "Auction has not ended yet");

        address winner = highestBids[_tokenContract][_tokenId][owner].bidder;
        if(winner == address(0)){
            if (keccak256(abi.encodePacked(auction.tokenType)) == keccak256(abi.encodePacked("erc721"))) {
                // ERC721
                IERC721(_tokenContract).safeTransferFrom(address(this), auction.seller, _tokenId);
            } else if (keccak256(abi.encodePacked(auction.tokenType)) == keccak256(abi.encodePacked("erc1155"))) {
                // ERC1155
                IERC1155(_tokenContract).safeTransferFrom(address(this),auction.seller,_tokenId,auction.tokenAmount, "");
            } else {
                revert("Unsupported token type");
            }
            delete auctions[_tokenContract][_tokenId][owner];
        }else{
        uint256 totalPrice = highestBids[_tokenContract][_tokenId][owner].amount;
        auctions[_tokenContract][_tokenId][owner].duration = 0;

        uint256 royalityFee = 0;
        address royaltyRecipient;

        // Transfer NFT to the winner
        if (keccak256(abi.encodePacked(auction.tokenType)) == keccak256(abi.encodePacked("erc721"))) {
            // ERC721
            IERC721 erc721Token = IERC721(_tokenContract);
             if(marketplaceToken == _tokenContract){
                royalityFee = erc721Token.royaltyFeeWithId(_tokenId);
            }
            else {
                royalityFee = erc721Token.royaltyFee();
            }
            royaltyRecipient = erc721Token.royaltyRecipient(_tokenId);
            IERC721(_tokenContract).safeTransferFrom(address(this), winner, _tokenId);
        } else if (keccak256(abi.encodePacked(auction.tokenType)) == keccak256(abi.encodePacked("erc1155"))) {
            // ERC1155
            IERC1155 erc1155Token = IERC1155(_tokenContract);
            royalityFee = erc1155Token.royaltyFee();
            royaltyRecipient = erc1155Token.royaltyRecipient(_tokenId);
            IERC1155(_tokenContract).safeTransferFrom(address(this), winner,_tokenId,auction.tokenAmount, "");
        } else {
            revert("Unsupported token type");
        }

        uint256 royaltyAmount = totalPrice.mul(royalityFee).div(100); // Calculate royalty amount
        uint256 sellerAmount = totalPrice.sub(royaltyAmount);
        uint256 marketPercentage = sellerAmount.mul(marketFeePercentage).div(100);
        uint256 sellerAmountFinal = sellerAmount.sub(marketFeePercentage);
    
        if (royaltyRecipient != address(0) && royaltyAmount > 0) {
            (bool royaltyTransferSuccess, ) = royaltyRecipient.call{value: royaltyAmount}("");
            require(royaltyTransferSuccess, "Failed to send royalty");
        }

        (bool marketPercentageSuccess, ) = marketplaceOwner.call{value: marketPercentage}("");
        require(marketPercentageSuccess, "marketplace percentage to send failed");

        (bool success, ) = auction.seller.call{value: sellerAmountFinal}("");
        require(success, "Payment to seller failed");

        delete auctions[_tokenContract][_tokenId][owner];
        delete highestBids[_tokenContract][_tokenId][owner];
        emit AuctionEnded(auction.seller, _tokenContract, _tokenId, winner, totalPrice);
      }
    }
    
}
