
module Cryptokami.Wallet.API.V1.Addresses where

import           Servant
import           Universum (Text)

import           Cryptokami.Wallet.API.Response
import           Cryptokami.Wallet.API.V1.Parameters
import           Cryptokami.Wallet.API.V1.Types


type API = "addresses" :> WalletRequestParams
                       :> Summary "Returns all the addresses."
                       :> Get '[ValidJSON] (WalletResponse [Address])
      :<|> "addresses" :> ReqBody '[ValidJSON] NewAddress
                       :> Summary "Creates a new Address."
                       :> Post '[ValidJSON] (WalletResponse WalletAddress)
      :<|> "addresses" :> Capture "address" Text
                       :> "validity"
                       :> Summary "Checks the validity of an address."
                       :> Get '[ValidJSON] (WalletResponse AddressValidity)
