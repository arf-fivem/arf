Player = {}

function Player:new(databaseResult)
    if not databaseResult then
        error "Cannot create player without database result!"
    end

    local player = {
        id = databaseResult.id,
        identifier = databaseResult.identifier,
        nameTitles = databaseResult.name_titles,
        firstName = databaseResult.first_name,
        lastName = databaseResult.last_name,
        lastName = databaseResult.last_name,
        birthDate = databaseResult.birth_date,
        sex = Sex:fromId(databaseResult.sex_id),
    }
end