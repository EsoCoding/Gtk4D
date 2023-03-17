/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module soup.WebsocketConnection;

private import gio.IOStream;
private import glib.Bytes;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.ListG;
private import glib.Str;
private import glib.Uri;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import soup.WebsocketExtension;
private import soup.c.functions;
public  import soup.c.types;
private import std.algorithm;


/**
 * The WebSocket Protocol
 * 
 * Provides support for the [WebSocket](http://tools.ietf.org/html/rfc6455)
 * protocol.
 * 
 * To connect to a WebSocket server, create a [class@Session] and call
 * [method@Session.websocket_connect_async]. To accept WebSocket
 * connections, create a [class@Server] and add a handler to it with
 * [method@Server.add_websocket_handler].
 * 
 * (Lower-level support is available via
 * [func@websocket_client_prepare_handshake] and
 * [func@websocket_client_verify_handshake], for handling the client side of the
 * WebSocket handshake, and [func@websocket_server_process_handshake] for
 * handling the server side.)
 * 
 * #SoupWebsocketConnection handles the details of WebSocket communication. You
 * can use [method@WebsocketConnection.send_text] and
 * [method@WebsocketConnection.send_binary] to send data, and the
 * [signal@WebsocketConnection::message] signal to receive data.
 * (#SoupWebsocketConnection currently only supports asynchronous I/O.)
 */
public class WebsocketConnection : ObjectG
{
	/** the main Gtk struct */
	protected SoupWebsocketConnection* soupWebsocketConnection;

	/** Get the main Gtk struct */
	public SoupWebsocketConnection* getWebsocketConnectionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupWebsocketConnection;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupWebsocketConnection;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupWebsocketConnection* soupWebsocketConnection, bool ownedRef = false)
	{
		this.soupWebsocketConnection = soupWebsocketConnection;
		super(cast(GObject*)soupWebsocketConnection, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_websocket_connection_get_type();
	}

	/**
	 * Creates a #SoupWebsocketConnection on @stream with the given active @extensions.
	 *
	 * This should be called after completing the handshake to begin using the WebSocket
	 * protocol.
	 *
	 * Params:
	 *     stream = a #GIOStream connected to the WebSocket server
	 *     uri = the URI of the connection
	 *     type = the type of connection (client/side)
	 *     origin = the Origin of the client
	 *     protocol = the subprotocol in use
	 *     extensions = a #GList of #SoupWebsocketExtension objects
	 *
	 * Returns: a new #SoupWebsocketConnection
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(IOStream stream, Uri uri, SoupWebsocketConnectionType type, string origin, string protocol, ListG extensions)
	{
		auto __p = soup_websocket_connection_new((stream is null) ? null : stream.getIOStreamStruct(), (uri is null) ? null : uri.getUriStruct(), type, Str.toStringz(origin), Str.toStringz(protocol), (extensions is null) ? null : extensions.getListGStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupWebsocketConnection*) __p, true);
	}

	/**
	 * Close the connection in an orderly fashion.
	 *
	 * Note that until the [signal@WebsocketConnection::closed] signal fires, the connection
	 * is not yet completely closed. The close message is not even sent until the
	 * main loop runs.
	 *
	 * The @code and @data are sent to the peer along with the close request.
	 * If @code is %SOUP_WEBSOCKET_CLOSE_NO_STATUS a close message with no body
	 * (without code and data) is sent.
	 * Note that the @data must be UTF-8 valid.
	 *
	 * Params:
	 *     code = close code
	 *     data = close data
	 */
	public void close(ushort code, string data)
	{
		soup_websocket_connection_close(soupWebsocketConnection, code, Str.toStringz(data));
	}

	/**
	 * Get the close code received from the WebSocket peer.
	 *
	 * This only becomes valid once the WebSocket is in the
	 * %SOUP_WEBSOCKET_STATE_CLOSED state. The value will often be in the
	 * [enum@WebsocketCloseCode] enumeration, but may also be an application
	 * defined close code.
	 *
	 * Returns: the close code or zero.
	 */
	public ushort getCloseCode()
	{
		return soup_websocket_connection_get_close_code(soupWebsocketConnection);
	}

	/**
	 * Get the close data received from the WebSocket peer.
	 *
	 * This only becomes valid once the WebSocket is in the
	 * %SOUP_WEBSOCKET_STATE_CLOSED state. The data may be freed once
	 * the main loop is run, so copy it if you need to keep it around.
	 *
	 * Returns: the close data or %NULL
	 */
	public string getCloseData()
	{
		return Str.toString(soup_websocket_connection_get_close_data(soupWebsocketConnection));
	}

	/**
	 * Get the connection type (client/server) of the connection.
	 *
	 * Returns: the connection type
	 */
	public SoupWebsocketConnectionType getConnectionType()
	{
		return soup_websocket_connection_get_connection_type(soupWebsocketConnection);
	}

	/**
	 * Get the extensions chosen via negotiation with the peer.
	 *
	 * Returns: a #GList of #SoupWebsocketExtension objects
	 */
	public ListG getExtensions()
	{
		auto __p = soup_websocket_connection_get_extensions(soupWebsocketConnection);

		if(__p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) __p);
	}

	/**
	 * Get the I/O stream the WebSocket is communicating over.
	 *
	 * Returns: the WebSocket's I/O stream.
	 */
	public IOStream getIoStream()
	{
		auto __p = soup_websocket_connection_get_io_stream(soupWebsocketConnection);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IOStream)(cast(GIOStream*) __p);
	}

	/**
	 * Gets the keepalive interval in seconds or 0 if disabled.
	 *
	 * Returns: the keepalive interval.
	 */
	public uint getKeepaliveInterval()
	{
		return soup_websocket_connection_get_keepalive_interval(soupWebsocketConnection);
	}

	/**
	 * Gets the maximum payload size allowed for incoming packets.
	 *
	 * Returns: the maximum payload size.
	 */
	public ulong getMaxIncomingPayloadSize()
	{
		return soup_websocket_connection_get_max_incoming_payload_size(soupWebsocketConnection);
	}

	/**
	 * Get the origin of the WebSocket.
	 *
	 * Returns: the origin
	 */
	public string getOrigin()
	{
		return Str.toString(soup_websocket_connection_get_origin(soupWebsocketConnection));
	}

	/**
	 * Get the protocol chosen via negotiation with the peer.
	 *
	 * Returns: the chosen protocol
	 */
	public string getProtocol()
	{
		return Str.toString(soup_websocket_connection_get_protocol(soupWebsocketConnection));
	}

	/**
	 * Get the current state of the WebSocket.
	 *
	 * Returns: the state
	 */
	public SoupWebsocketState getState()
	{
		return soup_websocket_connection_get_state(soupWebsocketConnection);
	}

	/**
	 * Get the URI of the WebSocket.
	 *
	 * For servers this represents the address of the WebSocket, and
	 * for clients it is the address connected to.
	 *
	 * Returns: the URI
	 */
	public Uri getUri()
	{
		auto __p = soup_websocket_connection_get_uri(soupWebsocketConnection);

		if(__p is null)
		{
			return null;
		}

		return new Uri(cast(GUri*) __p);
	}

	/**
	 * Send a binary message to the peer.
	 *
	 * If @length is 0, @data may be %NULL.
	 *
	 * The message is queued to be sent and will be sent when the main loop
	 * is run.
	 *
	 * Params:
	 *     data = the message contents
	 */
	public void sendBinary(ubyte[] data)
	{
		soup_websocket_connection_send_binary(soupWebsocketConnection, data.ptr, cast(size_t)data.length);
	}

	/**
	 * Send a message of the given @type to the peer. Note that this method,
	 * allows to send text messages containing %NULL characters.
	 *
	 * The message is queued to be sent and will be sent when the main loop
	 * is run.
	 *
	 * Params:
	 *     type = the type of message contents
	 *     message = the message data as #GBytes
	 */
	public void sendMessage(SoupWebsocketDataType type, Bytes message)
	{
		soup_websocket_connection_send_message(soupWebsocketConnection, type, (message is null) ? null : message.getBytesStruct());
	}

	/**
	 * Send a %NULL-terminated text (UTF-8) message to the peer.
	 *
	 * If you need to send text messages containing %NULL characters use
	 * [method@WebsocketConnection.send_message] instead.
	 *
	 * The message is queued to be sent and will be sent when the main loop
	 * is run.
	 *
	 * Params:
	 *     text = the message contents
	 */
	public void sendText(string text)
	{
		soup_websocket_connection_send_text(soupWebsocketConnection, Str.toStringz(text));
	}

	/**
	 * Sets the interval in seconds on when to send a ping message which will serve
	 * as a keepalive message.
	 *
	 * If set to 0 the keepalive message is disabled.
	 *
	 * Params:
	 *     interval = the interval to send a ping message or 0 to disable it
	 */
	public void setKeepaliveInterval(uint interval)
	{
		soup_websocket_connection_set_keepalive_interval(soupWebsocketConnection, interval);
	}

	/**
	 * Sets the maximum payload size allowed for incoming packets.
	 *
	 * It does not limit the outgoing packet size.
	 *
	 * Params:
	 *     maxIncomingPayloadSize = the maximum payload size
	 */
	public void setMaxIncomingPayloadSize(ulong maxIncomingPayloadSize)
	{
		soup_websocket_connection_set_max_incoming_payload_size(soupWebsocketConnection, maxIncomingPayloadSize);
	}

	/**
	 * Emitted when the connection has completely closed.
	 *
	 * This happens either due to an orderly close from the peer, one
	 * initiated via [method@WebsocketConnection.close] or a fatal error
	 * condition that caused a close.
	 *
	 * This signal will be emitted once.
	 */
	gulong addOnClosed(void delegate(WebsocketConnection) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "closed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This signal will be emitted during an orderly close.
	 */
	gulong addOnClosing(void delegate(WebsocketConnection) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "closing", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when an error occurred on the WebSocket.
	 *
	 * This may be fired multiple times. Fatal errors will be followed by
	 * the [signal@WebsocketConnection::closed] signal being emitted.
	 *
	 * Params:
	 *     error = the error that occured
	 */
	gulong addOnError(void delegate(ErrorG, WebsocketConnection) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "error", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when we receive a message from the peer.
	 *
	 * As a convenience, the @message data will always be
	 * %NULL-terminated, but the NUL byte will not be included in
	 * the length count.
	 *
	 * Params:
	 *     type = the type of message contents
	 *     message = the message data
	 */
	gulong addOnMessage(void delegate(int, Bytes, WebsocketConnection) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "message", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when we receive a Pong frame (solicited or
	 * unsolicited) from the peer.
	 *
	 * As a convenience, the @message data will always be
	 * %NULL-terminated, but the NUL byte will not be included in
	 * the length count.
	 *
	 * Params:
	 *     message = the application data (if any)
	 */
	gulong addOnPong(void delegate(Bytes, WebsocketConnection) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "pong", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
