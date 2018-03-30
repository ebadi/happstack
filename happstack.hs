import Control.Monad (msum)
import Happstack.Server                   ( Response, ServerPart, defaultBodyPolicy
                                          , decodeBody, dir, nullConf, ok
                                          , simpleHTTP, toResponse )

main :: IO ()
main =  simpleHTTP nullConf handlers


handlers :: ServerPart Response
handlers = do
    decodeBody (defaultBodyPolicy "/tmp/" 10000 1000 1000)
    msum [
            dir "hello" $ ok $ toResponse "HELLO"
         ]



