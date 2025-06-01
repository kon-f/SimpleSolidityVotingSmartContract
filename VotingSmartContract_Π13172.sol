// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Poll {
        string question;
        mapping(address => bool) hasVoted;
        uint yesVotes;
        uint noVotes;
        bool isOpen;
    }

    Poll[] public polls;

    // Δημιουργία νέας ψηφοφορίας
    function createPoll(string memory _question) public {
        Poll storage newPoll = polls.push();
        newPoll.question = _question;
        newPoll.yesVotes = 0;
        newPoll.noVotes = 0;
        newPoll.isOpen = true;
    }

    // Ψήφος σε ψηφοφορία
    function vote(uint _pollIndex, bool _vote) public {
        require(_pollIndex < polls.length, "Poll does not exist");
        Poll storage poll = polls[_pollIndex];
        require(poll.isOpen, "Poll is closed");
        require(!poll.hasVoted[msg.sender], "You have already voted");

        poll.hasVoted[msg.sender] = true;
        if (_vote) {
            poll.yesVotes++;
        } else {
            poll.noVotes++;
        }
    }

    // Κλείσιμο ψηφοφορίας
    function closePoll(uint _pollIndex) public {
        require(_pollIndex < polls.length, "Poll does not exist");
        Poll storage poll = polls[_pollIndex];
        poll.isOpen = false;
    }

    // Προβολή αποτελεσμάτων
    function getResults(uint _pollIndex) public view returns (string memory question, uint yesVotes, uint noVotes, bool isOpen) {
        require(_pollIndex < polls.length, "Poll does not exist");
        Poll storage poll = polls[_pollIndex];
        return (poll.question, poll.yesVotes, poll.noVotes, poll.isOpen);
    }
}