require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/view_word')do
  @words = Word.all()
    erb(:view_word)
end

get('/view_word/new') do
  erb(:word_form)
end

post('/view_word') do
  word = params[:word]
  new_word = Word.new({:vocab=>word})
  new_word.save()
  @words = Word.all()
  erb(:view_word)
end

get('/word_def_page/:id') do
  @word = Word.find(params[:id])
  erb(:word_def_page)
end

post('/word_def_page/:id') do
  @word = Word.find(params[:id])
  definition = params[:definition]
  new_definition = Definition.new({:definition=> definition})
  @word.add_definition(new_definition)
  erb(:word_def_page)
end
