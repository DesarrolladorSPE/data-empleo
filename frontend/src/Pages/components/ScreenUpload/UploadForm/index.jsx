import React from "react";
import "./styles.css";
import { AppContext } from "../../../../Context";
import { WrapperContainer1 } from "../../WrapperContainers";
import { SubTitle } from "../../SubTitle";
import { OptionInputCard, UploadFileCard } from "../../InputsCards";
import { ButtonCard } from "../../ButtonCard";
import { handleFileChange } from "../../../../utils/handleFileChange";
import { handlePostFile } from "../../../../utils/handleData/handlePostData";
import { handleInputChange } from "../../../../utils/handleInputChange";
import { handleNotifications } from "../../../../utils/handleNotifications";
import { reloadLocation } from "../../../../utils/realoadLocation";
import { uriDropNav } from "../../../../utils/uriDropNav";

const UploadForm = () => {
    const context = React.useContext(AppContext);

    const [values, setValues] = React.useState({
        file: null,
        selectedOption: Object.keys(uriDropNav)[0],
    });

    const handleFileUpload = async (event) => {
        event.preventDefault();

        if (!(values.file && values.selectedOption)) {
            handleNotifications("error", "Por favor, seleccione un archivo y el tipo antes de cargar.")
            return;
        }

        const formData = new FormData();
        formData.append('file', values.file);

        await handlePostFile(event, formData, "/file/upload", reloadLocation, {"selectedOption": values.selectedOption,});
    };

    
    return(
        <WrapperContainer1 padding={30}>
            <form encType="multipart/form-data" className="upload-form-container" onSubmit={handleFileUpload}>
                <SubTitle>
                    Por favor seleccione un archivo
                </SubTitle>
                <UploadFileCard
                    id={"file"}
                    onChange={(event) => handleFileChange(event, ['.xlsx', '.pdf'], setValues)}
                    description={values.file ? values.file?.name : "Archivos PDF (.pdf) o Excel (.xlsx)"}
                />


                <OptionInputCard
                    id={"document-type-options"}
                    label={"Seleccione el tipo de Documento a Cargar"}
                    array={Object.keys(uriDropNav)}
                    onChange={(event) => {handleInputChange("selectedOption", event, setValues)}}
                    defaultValue={values?.selectedOption}
                />


                <ButtonCard 
                    title="Guardar y Publicar Archivo"
                    type="submit"
                >
                    Guardar y Publicar Archivo
                </ButtonCard>
            </form>
        </WrapperContainer1>
    )
}

export { UploadForm };