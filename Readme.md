# 🗳️ Voting Smart Contract

This is a simple voting smart contract written in Solidity, developed as part of a university project. It allows users to create polls, vote (yes/no), and view results. The contract was written and tested using the Remix IDE.

## 🔍 Features

- **Create Poll**: Deploy a new poll with a question.
- **Vote**: Users can vote (true = Yes / false = No) in open polls.
- **Close Poll**: Polls can be manually closed to prevent further voting.
- **View Results**: Retrieve the question, votes, and poll status.

## ⚙️ Tech Stack

- **Solidity** `^0.8.0`
- **Remix IDE** for development and testing

## 📁 Project Structure

```
VotingSmartContract/
├── contracts/
│ └── Voting.sol
├── README.md
├── LICENSE
```

## 🧪 Testing

All contract functions were tested manually in the [Remix IDE](https://remix.ethereum.org). No UI is provided, as interaction is done directly via smart contract function calls.

## 📝 Notes

- Each address can only vote once per poll.
- Polls must be closed manually by calling the `closePoll()` function.
- Results can be retrieved anytime using `getResults()`.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
