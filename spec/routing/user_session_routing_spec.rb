# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UserSessionsController, type: :routing do
  describe 'routing' do
    # DELETE

    it 'does route DELETE /user_session' do
      expect(
        delete: '/user_session'
      ).to route_to action: 'destroy',
                    controller: 'user_sessions'
    end

    # GET

    it 'does route GET /user_session' do
      expect(
        get: '/user_session'
      ).not_to be_routable
    end

    # PATCH

    it 'does route PATCH /user_session' do
      expect(
        patch: '/user_session'
      ).to route_to action: 'update',
                    controller: 'user_sessions'
    end

    # POST

    it 'does route POST /user_session' do
      expect(
        post: '/user_session'
      ).to route_to action: 'create',
                    controller: 'user_sessions'
    end

    # PUT

    it 'does route PUT /user_session' do
      expect(
        put: '/user_session'
      ).to route_to action: 'update',
                    controller: 'user_sessions'
    end
  end
end
