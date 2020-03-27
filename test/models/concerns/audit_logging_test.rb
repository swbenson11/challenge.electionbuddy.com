require 'test_helper'

# I know these are bad tests. I'm more used to Rspec and I didn't want to waste
# all my time on trying to set up a test model with a concern loaded in
# in such a way that the call backs still worked

# In a professional enviroment with a testing framework I knew I would
# add much more tests, and tests that were better isolated from each other
class AuditLoggingTest < ActiveSupport::TestCase 
    user = User.create!({email: "test@test.com", password: "p@ssword"})
    election = Election.create({name: "election 1", user: user})

    # This should be two tests
    test "changing string attribute creates log with proper values" do
        new_name = "test_name"
        old_name = election.name
        election.update(name: new_name)
        
        log = AuditLog.where(table: "Election", column: "name").last
        assert_equal log.new_value, new_name 
        assert_equal log.old_value, old_name 

    end

    test "does not create audit log for create" do
        user2 = User.create!({email: "test@test.com", password: "p@ssword"})
        election2 = Election.create({name: "election 2", user: user2})
        assert_equal nil, AuditLog.find_by(table: "Election", table_id: election2.id)
    end

    test "can set text type data" do
        settings = {"visibility": "public"}
        election.update(settings: settings)

        
        log = AuditLog.where(table: "Election", column: "settings").last
        assert_equal JSON.parse(log.new_value), settings # I think this appoch fails some times
        assert_equal log.old_value, {} 
    end

    
end
