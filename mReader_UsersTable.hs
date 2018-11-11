{--Вспомним пример с базой пользователей и паролей:

type User = String
type Password = String
type UsersTable = [(User, Password)]
Реализуйте функцию, принимающую в качестве окружения UsersTable и возвращающую список пользователей, использующих пароль "123456" (в том же порядке, в котором они перечислены в базе).--}

usersWithBadPasswords :: Reader UsersTable [User]
usersWithBadPasswords = do
    asks (\e -> map fst (filter (\p -> (snd p) == "123456") e))
