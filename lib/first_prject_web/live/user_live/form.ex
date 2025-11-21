defmodule FirstPrjectWeb.UserLive.Form do
  use FirstPrjectWeb, :live_view

  alias FirstPrject.Accounts
  alias FirstPrject.Accounts.User

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="mb-6">
        <.link
          navigate="/users"
          class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 hover:border-gray-400 transition-all shadow-sm hover:shadow"
        >
          <span class="text-lg">←</span>
          Back to Users
        </.link>
      </div>

      <div class="bg-white rounded-xl shadow-lg p-8 max-w-2xl mx-auto">
        <div class="mb-8">
          <h1 class="text-2xl font-bold text-gray-900">{@page_title}</h1>
          <p class="mt-2 text-gray-600">Fill in the information below to manage user records.</p>
        </div>

        <.form for={@form} phx-change="validate" phx-submit="save" id="user-form">
          <div class="space-y-6">
            <div class="bg-blue-50 p-4 rounded-lg">
              <.input
                field={@form[:name]}
                type="text"
                label="Full Name"
                placeholder="Enter full name..."
              />
            </div>

            <div class="bg-purple-50 p-4 rounded-lg">
              <.input
                field={@form[:email]}
                type="email"
                label="Email Address"
                placeholder="example@email.com"
              />
            </div>

            <div class="bg-green-50 p-4 rounded-lg">
              <.input
                field={@form[:age]}
                type="number"
                label="Age"
                placeholder="Enter age..."
              />
            </div>
          </div>

          <div class="flex gap-4 justify-end mt-8 pt-6 border-t border-gray-200">
            <.button
              phx-disable-with="Saving..."
              class="px-6 py-3 bg-gradient-to-r from-blue-500 to-indigo-600 hover:from-blue-600 hover:to-indigo-700 text-white font-semibold rounded-lg shadow-md hover:shadow-lg transition-all"
            >
              💾 Save User
            </.button>
          </div>
        </.form>
      </div>
    </Layouts.app>
    """
  end

  @impl true
  def mount(params, _session, socket) do
    user = load_user(params)

    {:ok,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:user, user)
     |> assign(:form, to_form(Accounts.change_user(user)))}
  end

  @impl true
  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      socket.assigns.user
      |> Accounts.change_user(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    save_user(socket, socket.assigns.live_action, user_params)
  end

  defp save_user(socket, :edit, user_params) do
    case Accounts.update_user(socket.assigns.user, user_params) do
      {:ok, _user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User updated successfully")
         |> push_navigate(to: ~p"/users")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  defp save_user(socket, :new, user_params) do
    case Accounts.create_user(user_params) do
      {:ok, _user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_navigate(to: ~p"/users")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  defp load_user(%{"id" => id}), do: Accounts.get_user!(id)
  defp load_user(_params), do: %User{}

  defp page_title(:new), do: "New User"
  defp page_title(:edit), do: "Edit User"
end
