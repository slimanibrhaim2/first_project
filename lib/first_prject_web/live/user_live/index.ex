defmodule FirstPrjectWeb.UserLive.Index do
  use FirstPrjectWeb, :live_view

  alias FirstPrject.Accounts

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>


      <div class="mb-6 bg-orange-100 p-4 rounded-lg">
      <.link
        navigate="/"
        class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-orange-800 bg-orange-500 text-white border border-orange-600 rounded-lg hover:bg-orange-600 hover:border-orange-700 transition-all shadow-sm hover:shadow"      >
        <span class="text-lg">←</span>
        Back to Home
      </.link>
      </div>


      <.header>
      <span class="text-3xl font-bold text-gray-900">Listing Users</span>
      <:actions>
          <.button variant="primary" navigate={~p"/users/new"}>
            <.icon name="hero-plus" /> New User
          </.button>
        </:actions>
      </.header>
      <div class="bg-white rounded-lg shadow-md overflow-hidden">
      <.table
        id="users"
        rows={@streams.users}
        row_click={fn {_id, user} -> JS.navigate(~p"/users/#{user}") end}
      >
        <:col :let={{_id, user}} label="Name">
          <div class="flex items-center gap-3">
            <div class="w-10 h-10 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-bold">
              {String.first(user.name)}
            </div>
            <span class="font-medium text-gray-900">{user.name}</span>
          </div>
        </:col>

        <:col :let={{_id, user}} label="Email">
          <span class="text-gray-600">{user.email}</span>
        </:col>

        <:col :let={{_id, user}} label="Age">
          <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
            {user.age} years
          </span>
        </:col>

        <:action :let={{_id, user}}>
          <.link
            navigate={~p"/users/#{user}"}
            class="inline-flex items-center px-3 py-1.5 text-sm font-medium text-blue-600 hover:text-blue-800 hover:bg-blue-50 rounded transition-colors"
          >
            👁️ View
          </.link>
        </:action>

        <:action :let={{_id, user}}>
          <.link
            navigate={~p"/users/#{user}/edit"}
            class="inline-flex items-center px-3 py-1.5 text-sm font-medium text-green-600 hover:text-green-800 hover:bg-green-50 rounded transition-colors"
          >
            ✏️ Edit
          </.link>
        </:action>

        <:action :let={{id, user}}>
          <.link
            phx-click={JS.push("delete", value: %{id: user.id}) |> hide("##{id}")}
            data-confirm="Are you sure you want to delete this user?"
            class="inline-flex items-center px-3 py-1.5 text-sm font-medium text-red-600 hover:text-red-800 hover:bg-red-50 rounded transition-colors"
          >
            🗑️ Delete
          </.link>
        </:action>
      </.table>
    </div>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Listing Users")
     |> stream(:users, list_users())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    user = Accounts.get_user!(id)
    {:ok, _} = Accounts.delete_user(user)

    {:noreply, stream_delete(socket, :users, user)}
  end

  defp list_users() do
    Accounts.list_users()
  end
end
