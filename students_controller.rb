require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get'/students' do
  @peeps = Student.all()
  erb(:peeps)
end

# new

get '/students/new' do
erb(:new)
end

# create

post '/students' do
@student = Student.new(params)
@student.save()
erb(:create)
end


# show
get '/students/:id' do
@student = Student.find(params[:id])
erb(:student)
end

# edit

get '/students/:id/edit' do
@student = Student.find(params[:id])
erb(:edit)
end

# update

post '/students/:id' do
Student.new(params).update
redirect to '/students'
end

# destroy
get '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete()
  redirect to '/students'
end
