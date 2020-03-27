class ElectionAuditController < ApplicationController
    before_action :authenticate_user!
    before_action :set_election, only: [:show]
  
    def index
      @elections = current_user.elections
    end
  
    def show
      @election_audits = AuditLog.where(table: "Election", table_id: @election)
      # I was going to try and display all of the audit info for election, voters
      # questions, and answers on this page, but I ran out of time

      #my approch would be :
      # get all the voters for an election
      @voters =  Voter.where(election: @election)
      #store it in a hash for use in the view
      @voter_audits = {}
      @voters.find_each do |vote| 
        @voter_audits.store(vote.id, AuditLog.where(table: "Voter", table_id: vote.id))
      end
      # this chunk above should be it's own private method, or better yet,
      # an activity/service. e.g. GetAudits

      # Storeing the audits in a hash is kinda of akward, but I'm trying to avoid
      # having logic in the view (which I did not complete). I'm also trying
      # to avoid putting it in the logic in the model and creating a god class
    
      # one approch to slim this down is have the election model act as a bit of a 
      # fascade with it delegating calls to services to build audit reports. 
      
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_election
        @election = Election.find(params[:id])
      end
  end
  