const db = require("../data/dbConfig.js");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
};

function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes").where({ id }).first();
}

function findSteps(schemeId) {
    return db("steps as p")
        .join("schemes as u", "u.id", "p.scheme_id")
        .select("p.id", "p.instructions", "p.step_number")
        .where("p.scheme_id", schemeId);
}

function add(scheme) {
    return db("schemes")
        .insert(scheme)
        .then((ids) => {
            return getById(ids[0]);
        });
}

function update(id, changes) {
    return db("schemes").where({ id }).update(changes);
}

function remove(id) {
    return db("schemes").where("id", id).del();
}
