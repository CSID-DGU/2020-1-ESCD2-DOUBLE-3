package chain;
import java.util.ArrayList;

import pwchange.Transaction_original;
import pwchange.Util_original;

public class Blockchain {

	
	private int blockID;
	private int nonce;
	private ArrayList<Transaction_original> transactionList;
	private String previousBlockHash;
	
	public String getPreviousBlockHash() {
		return previousBlockHash;
	}
	public void setPreviousBlockHash(String previousBlockHash) {
		this.previousBlockHash = previousBlockHash;
	}
	public int getBlockID() {
		return blockID;
	}
	public void setBlockID(int blockID) {
		this.blockID = blockID;
	}
	public int getNonce() {
		return nonce;
	}
	public void setNonce(int nonce) {
		this.nonce = nonce;
	}

	public void addTransaction(Transaction_original transaction) {
		transactionList.add(transaction);
	}
	public Blockchain(int blockID,String previousBlockHash, int nonce, ArrayList transactionList) {
		
		this.blockID = blockID;
		this.previousBlockHash=previousBlockHash;
		this.nonce = nonce;
		this.transactionList=transactionList;
	}
	public String getBlockHash() {
		String transactionInformations="";
		for(int i=0;i<transactionList.size();i++) {
			transactionInformations+=transactionList.get(i).getInfo();
		}
		return Util_original.getHash(nonce+transactionInformations+this.getPreviousBlockHash());
	}
	
	public void mine() {
		while(true) {
			if(this.getBlockHash().substring(0,4).equals("0000")) {
				System.out.println(blockID+"번째 블록 채굴 성공");break;
			}nonce++;
		}
		
		
		
	}
	public void getinfo() {
		System.out.println("------------------------------------------------");
		System.out.println("블록 번호 : "+ this.getBlockID());
		System.out.println("이전 블록 해시 : "+ this.getPreviousBlockHash());
		System.out.println("채굴 변수 값 : "+ this.getNonce());
		System.out.println("트랜잭션 개수 : "+ transactionList.size()+"개");
		for(int i=0;i<transactionList.size();i++) {
			System.out.println(transactionList.get(i).getInfo());
			
		}
		System.out.println("블록 해시 : "+ this.getBlockHash());
		
		System.out.println("------------------------------------------------");
	}

	
	
	
}
