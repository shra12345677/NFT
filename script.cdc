import CryptoPoops from 0x06
import NonFungibleToken from 0x05

pub fun main(account: Address): &NonFungibleToken.NFT {

  let publicRefrence = getAccount(account).getCapability(/public/Collection) 
                          .borrow<&CryptoPoops.Collection{CryptoPoops.mycollection}>() 
                          ?? panic("Collection is Absent")
                          
  let NFTId = publicRefrence.getIDs()
  return publicRefrence.borrowAuthNFT(id:NFTId[0])
}
