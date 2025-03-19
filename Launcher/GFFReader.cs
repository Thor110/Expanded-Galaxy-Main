public class GFFReader
{
    private BinaryReader reader;
    public GFFReader(BinaryReader binaryReader)
    {
        reader = binaryReader;
        SkipHeader();
    }
    private void SkipHeader()
    {
        reader.BaseStream.Seek(12, SeekOrigin.Begin);
    }
    public GFFHeader ReadHeader()
    {
        GFFHeader header = new GFFHeader();

        header.StructOffset = reader.ReadInt32();
        header.StructCount = reader.ReadInt32();
        header.FieldOffset = reader.ReadInt32();
        header.FieldCount = reader.ReadInt32();
        header.LabelOffset = reader.ReadInt32();
        header.LabelCount = reader.ReadInt32();
        header.FieldDataOffset = reader.ReadInt32();
        header.FieldDataCount = reader.ReadInt32();
        header.FieldIndicesOffset = reader.ReadInt32();
        header.FieldIndicesCount = reader.ReadInt32();
        header.ListIndicesOffset = reader.ReadInt32();
        header.ListIndicesCount = reader.ReadInt32();

        return header;
    }
}
public class GFFHeader
{
    public int StructOffset { get; set; }
    public int StructCount { get; set; }
    public int FieldOffset { get; set; }
    public int FieldCount { get; set; }
    public int LabelOffset { get; set; }
    public int LabelCount { get; set; }
    public int FieldDataOffset { get; set; }
    public int FieldDataCount { get; set; }
    public int FieldIndicesOffset { get; set; }
    public int FieldIndicesCount { get; set; }
    public int ListIndicesOffset { get; set; }
    public int ListIndicesCount { get; set; }
}