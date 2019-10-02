        <%  flash.each do |name, msg| %>
          <%  msg.each do |m| %>
            <p><%=  content_tag :div, m, class: "#{name} center" %></p>
          <% end %>
        <% end %>
      </footer>