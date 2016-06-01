# Homepage (Root path)

get '/' do 
  erb :index
end

get '/contacts.json' do 
  @contacts = Contact.all.order(first_name: :asc)
  @contacts.to_json
end


delete '/contact-delete/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
end

post '/contact-add.json' do
  @new_contact = Contact.new(params[:contact])  
  puts params
  puts @new_contact

    if @new_contact.save
      puts("the contact saved")
      {
      success: true,
      contact: @new_contact
      }.to_json
    else
      puts("The contact didn't save")
      { success: false, message: @new_contact.errors.full_messages.first }.to_json
    end
end

# post '/contact-update' do
#   @contact = Contact.find_by(id: params[:contact_id])
#   if @contact.update!(
#     first_name: params[:first_name],
#     last_name: params[:last_name],
#     email: params[:email],
#     phone: params[:phone]
#     )
#     json  :contact => { contact:  @contact }
#   end
# end
