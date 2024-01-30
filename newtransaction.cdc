import CryptoPoops from 0x06
import NonFungibleToken from 0x05

transaction(recipient: Address, name: String, favouriteFood: String, luckyNumber: Int) {

  prepare(acct: AuthAccount) {
    let nftMinter = acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter) ?? panic("nft minter Missing")

    let publicRefrence = getAccount(recipient).getCapability(/public/Collection) 
                          .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>() 
                          ?? panic("Collection is Missing")

    publicRefrence.deposit(token: <-nftMinter.createNFT(name: name, favouriteFood: favouriteFood, luckyNumber: luckyNumber))
  }

  execute {
    log("Your Nft Minted")
    }
}
