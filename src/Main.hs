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
  {- continue -}
