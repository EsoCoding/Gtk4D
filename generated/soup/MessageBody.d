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


module soup.MessageBody;

private import glib.Bytes;
private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import soup.c.functions;
public  import soup.c.types;


/**
 * #SoupMessageBody represents the request or response body of a
 * [class@Message].
 * 
 * Note that while @length always reflects the full length of the
 * message body, @data is normally %NULL, and will only be filled in
 * after [method@MessageBody.flatten] is called. For client-side
 * messages, this automatically happens for the response body after it
 * has been fully read. Likewise, for server-side
 * messages, the request body is automatically filled in after being
 * read.
 * 
 * As an added bonus, when @data is filled in, it is always terminated
 * with a `\0` byte (which is not reflected in @length).
 */
public final class MessageBody
{
	/** the main Gtk struct */
	protected SoupMessageBody* soupMessageBody;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public SoupMessageBody* getMessageBodyStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupMessageBody;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)soupMessageBody;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupMessageBody* soupMessageBody, bool ownedRef = false)
	{
		this.soupMessageBody = soupMessageBody;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( ownedRef )
			soup_message_body_unref(soupMessageBody);
	}


	/**
	 * the data
	 */
	public @property string data()
	{
		return Str.toString(soupMessageBody.data);
	}

	/** Ditto */
	public @property void data(string value)
	{
		soupMessageBody.data = Str.toStringz(value);
	}

	/**
	 * length of @data
	 */
	public @property long length()
	{
		return soupMessageBody.length;
	}

	/** Ditto */
	public @property void length(long value)
	{
		soupMessageBody.length = value;
	}

	/** */
	public static GType getType()
	{
		return soup_message_body_get_type();
	}

	/**
	 * Creates a new #SoupMessageBody.
	 *
	 * [class@Message] uses this internally; you
	 * will not normally need to call it yourself.
	 *
	 * Returns: a new #SoupMessageBody.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = soup_message_body_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupMessageBody*) __p);
	}

	/**
	 * Appends @length bytes from @data to @body according to @use.
	 *
	 * Params:
	 *     use = how to use @data
	 *     data = data to append
	 */
	public void append(SoupMemoryUse use, ubyte[] data)
	{
		soup_message_body_append(soupMessageBody, use, data.ptr, cast(size_t)data.length);
	}

	/**
	 * Appends the data from @buffer to @body.
	 *
	 * Params:
	 *     buffer = a #GBytes
	 */
	public void appendBytes(Bytes buffer)
	{
		soup_message_body_append_bytes(soupMessageBody, (buffer is null) ? null : buffer.getBytesStruct());
	}

	/**
	 * Appends @length bytes from @data to @body.
	 *
	 * This function is exactly equivalent to [method@MessageBody.append]
	 * with %SOUP_MEMORY_TAKE as second argument; it exists mainly for
	 * convenience and simplifying language bindings.
	 *
	 * Params:
	 *     data = data to append
	 */
	public void appendTake(char[] data)
	{
		soup_message_body_append_take(soupMessageBody, data.ptr, cast(size_t)data.length);
	}

	/**
	 * Tags @body as being complete.
	 *
	 * Call this when using chunked encoding after you have appended the last chunk.
	 */
	public void complete()
	{
		soup_message_body_complete(soupMessageBody);
	}

	/**
	 * Fills in @body's data field with a buffer containing all of the
	 * data in @body.
	 *
	 * Adds an additional `\0` byte not counted by @body's
	 * length field.
	 *
	 * Returns: a #GBytes containing the same data as @body.
	 *     (You must [method@GLib.Bytes.unref] this if you do not want it.)
	 */
	public Bytes flatten()
	{
		auto __p = soup_message_body_flatten(soupMessageBody);

		if(__p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) __p, true);
	}

	/**
	 * Gets the accumulate flag on @body.
	 *
	 * See [method@MessageBody.set_accumulate. for details.
	 *
	 * Returns: the accumulate flag for @body.
	 */
	public bool getAccumulate()
	{
		return soup_message_body_get_accumulate(soupMessageBody) != 0;
	}

	/**
	 * Gets a [struct@GLib.Bytes] containing data from @body starting at @offset.
	 *
	 * The size of the returned chunk is unspecified. You can iterate
	 * through the entire body by first calling
	 * [method@MessageBody.get_chunk] with an offset of 0, and then on each
	 * successive call, increment the offset by the length of the
	 * previously-returned chunk.
	 *
	 * If @offset is greater than or equal to the total length of @body,
	 * then the return value depends on whether or not
	 * [method@MessageBody.complete] has been called or not; if it has,
	 * then [method@MessageBody.get_chunk] will return a 0-length chunk
	 * (indicating the end of @body). If it has not, then
	 * [method@MessageBody.get_chunk] will return %NULL (indicating that
	 * @body may still potentially have more data, but that data is not
	 * currently available).
	 *
	 * Params:
	 *     offset = an offset
	 *
	 * Returns: a #GBytes
	 */
	public Bytes getChunk(long offset)
	{
		auto __p = soup_message_body_get_chunk(soupMessageBody, offset);

		if(__p is null)
		{
			return null;
		}

		return new Bytes(cast(GBytes*) __p, true);
	}

	/**
	 * Handles the #SoupMessageBody part of receiving a chunk of data from
	 * the network.
	 *
	 * Normally this means appending @chunk to @body, exactly as with
	 * [method@MessageBody.append_bytes], but if you have set @body's accumulate
	 * flag to %FALSE, then that will not happen.
	 *
	 * This is a low-level method which you should not normally need to
	 * use.
	 *
	 * Params:
	 *     chunk = a #GBytes received from the network
	 */
	public void gotChunk(Bytes chunk)
	{
		soup_message_body_got_chunk(soupMessageBody, (chunk is null) ? null : chunk.getBytesStruct());
	}

	alias doref = ref_;
	/**
	 * Atomically increments the reference count of @body by one.
	 *
	 * Returns: the passed in #SoupMessageBody
	 */
	public MessageBody ref_()
	{
		auto __p = soup_message_body_ref(soupMessageBody);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageBody)(cast(SoupMessageBody*) __p, true);
	}

	/**
	 * Sets or clears the accumulate flag on @body.
	 *
	 * (The default value is %TRUE.) If set to %FALSE, @body's data field will not
	 * be filled in after the body is fully sent/received, and the chunks that make
	 * up @body may be discarded when they are no longer needed.
	 *
	 * If you set the flag to %FALSE on the [class@Message] request_body of a
	 * client-side message, it will block the accumulation of chunks into
	 * @body's data field, but it will not normally cause the chunks to
	 * be discarded after being written like in the server-side
	 * [class@Message] response_body case, because the request body needs to
	 * be kept around in case the request needs to be sent a second time
	 * due to redirection or authentication.
	 *
	 * Params:
	 *     accumulate = whether or not to accumulate body chunks in @body
	 */
	public void setAccumulate(bool accumulate)
	{
		soup_message_body_set_accumulate(soupMessageBody, accumulate);
	}

	/**
	 * Deletes all of the data in @body.
	 */
	public void truncate()
	{
		soup_message_body_truncate(soupMessageBody);
	}

	/**
	 * Atomically decrements the reference count of @body by one.
	 *
	 * When the reference count reaches zero, the resources allocated by
	 * @body are freed
	 */
	public void unref()
	{
		soup_message_body_unref(soupMessageBody);
	}

	/**
	 * Handles the #SoupMessageBody part of writing a chunk of data to the
	 * network.
	 *
	 * Normally this is a no-op, but if you have set @body's accumulate flag to
	 * %FALSE, then this will cause @chunk to be discarded to free up memory.
	 *
	 * This is a low-level method which you should not need to use, and
	 * there are further restrictions on its proper use which are not
	 * documented here.
	 *
	 * Params:
	 *     chunk = a #GBytes returned from [method@MessageBody.get_chunk]
	 */
	public void wroteChunk(Bytes chunk)
	{
		soup_message_body_wrote_chunk(soupMessageBody, (chunk is null) ? null : chunk.getBytesStruct());
	}
}
