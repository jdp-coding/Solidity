// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 
안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
안건들을 모아놓은 자료구조도 구현하세요. 

사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)

* 사용자 등록 기능 - 사용자를 등록하는 기능
* 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
* 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
* 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
* 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
-------------------------------------------------------------------------------------------------
* 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 15개 블록 후에 전체의 70%가 투표에 참여하고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
*/

contract TEST_20250108 {

    // 안건 구조체
    struct Proposal {
        uint id;            // 번호
        string title;       // 제목
        string description; // 내용
        address proposer;   // 제안자(address)
        uint yesVotes;      // 찬성자 수
        uint noVotes;       // 반대자 수
    }

    // 사용자 구조체
    struct User {
        string name;                              // User name
        address userAddress;                     // User address
        uint[] createdProposals;                 // IDs of proposals created by the user
        mapping(string => bool) votedProposals;  // Records of proposals the user voted on (title => vote)
    }

    Proposal[] public proposals;

    mapping(address => User) public users;
    mapping(uint => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint id, string title, address proposer);
    event Voted(uint proposalId, address voter, bool vote);

    //안건 만들기
    function createProposal(string memory _title, string memory _description) public {
        uint proposalId = proposals.length + 1;
        proposals.push(Proposal({
            id: proposalId,
            title: _title,
            description: _description,
            proposer: msg.sender,
            yesVotes: 0,
            noVotes: 0
        }));

        emit ProposalCreated(proposalId, _title, msg.sender);
    }


    // 사용자 등록
    function registerUser(string memory _name) public {
        require(bytes(users[msg.sender].name).length == 0, "User already registered");

        User storage newUser = users[msg.sender];
        newUser.name = _name;
        newUser.userAddress = msg.sender;
    }


    //안건에 대한 투표
    function voteOnProposal(uint _proposalId, bool _vote) public {
        require(_proposalId < proposals.length+1, "Proposal does not exist");
        require(!hasVoted[_proposalId][msg.sender], "You have already voted on this proposal");

        Proposal storage proposal = proposals[_proposalId];

        if (_vote) {
            proposal.yesVotes++;
        } else {
            proposal.noVotes++;
        }

        hasVoted[_proposalId][msg.sender] = true;

        emit Voted(_proposalId, msg.sender, _vote);
    }




}
