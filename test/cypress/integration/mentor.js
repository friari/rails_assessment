describe("Rails mentor CRUD", function(){
    before(function() {
        cy.app('clean')
        cy.app('seed')
    });

    it("Create a new mentor", function(){
        cy.visit("/mentors/new")
        cy.get("input[type='text']")
    });
});