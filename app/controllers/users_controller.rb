class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Kirill',
        username: 'onlykir',
        avatar_url: 'https://sun9-50.userapi.com/impf/c850136/v850136968/d1b24/-EMtgReU__k.jpg?size=200x0&quality=90&crop=0,0,960,960&sign=add82e365922dc9063073cba745a4ca4&ava=1=50'
      ),
      User.new(
        id: 2,
        name: 'Serj',
        username: 'goody'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Kirill',
      username: 'onlykir',
      avatar_url: 'https://sun9-50.userapi.com/impf/c850136/v850136968/d1b24/-EMtgReU__k.jpg?size=200x0&quality=90&crop=0,0,960,960&sign=add82e365922dc9063073cba745a4ca4&ava=1=50'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('28.03.2016'))
    ]

    @new_question = Question.new
  end
end
