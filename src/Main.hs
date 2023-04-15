import Lib
import Web.Scotty (delete, get, post, put, scotty)
import Database.PostgreSQL.Simple

localPG :: ConnectInfo
localPG =
  defaultConnectInfo
    { connectHost = "0.0.0.0",
      connectDatabase = "products",
      connectUser = "postgres",
      connectPassword = "123456"
    }

main :: IO ()
main = do
  conn <- connect localPG




routes :: Connection -> IO ()
routes conn = scotty 8080 $ do
  get "/api/product/" $ getProducts conn

  get "/api/product/:id" $ getProduct conn

  post "/api/product/" $ createProduct conn

  put "/api/product/:id" $ updateProduct conn

  delete "/api/product/:id" $ deleteProduct conn
